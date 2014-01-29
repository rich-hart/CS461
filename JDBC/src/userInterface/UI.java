package userInterface;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import sqlConnection.ConnectionManager;
import datastructure.DataSetInfo;
import datastructure.DatabaseHandler;
import datastructure.Dataset;
import datastructure.Homework;
import datastructure.Question;
import datastructure.Response;
import datastructure.Student;


public class UI {

	private static UIimplementation UIimpl = new ConsoleUI();
	private static ConnectionManager manager;
	private static DatabaseHandler handler;
	private static String ConfSQL = "../../.pgpass";
	//private static String ConfSQL = "Mycredential";
	private static String AdminConfSQL = "Mycredential";
	private static int Connection; 

	public static void main (String[] args){

		screen0();

		manager = new ConnectionManager(AdminConfSQL);
		handler = new DatabaseHandler(manager);
		try {
			Connection = manager.newConnection();
			String[] Userauthentification = FileIO.getCredential(ConfSQL);
			
			// the students credential is stored in a file and read here
			// this ensures the student is accessing it from their account (a tux account)
			// anyone with a tux account can access it. Each student must create a file with credentials at the root.
			// See README.Student for instructions for each student.
			
			//if the user already used the system, they are in the system and we don't need to gather more information from them.
			String result = manager.request(Connection ,"Select * from students where userid = '" + Userauthentification[3] +"';");
			if (!result.contains(Userauthentification[3])) {
                // if the student is not in the DB, then gather necessary information and save credentials.
				screen1(Userauthentification[3]).AddtoDatabase(manager,Connection);

			}

			// Select which homework the student wishes to work on.
			Homework selectedhomework = screen2(Userauthentification[3]);
			
			//Select which question from the homework you previously selected
			Question selectedquestion = screen3(selectedhomework.getIDHomework(),Userauthentification[3]);
			
			//Process the question and submit the answer.
			screen4a(selectedquestion,Userauthentification[3]);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	//Welcome Screen
	public static void screen0()
	{
		UIimpl.PutLine("Welcome to the Drexel Postgre Autograder");
	}

	//When the student accesses the database the first time, ask them for the necessary contact information
	public static Student screen1(String StudentID)
	{
		UIimpl.PutLine("Please enter your first name:");
		String first_name = UIimpl.Readline();
		UIimpl.PutLine("Please enter your last name:");
		String last_name = UIimpl.Readline();
		UIimpl.PutLine("Please enter your email address:");
		String email1 = UIimpl.Readline();
		UIimpl.PutLine("Please re-enter your email address:");
		String email2 = UIimpl.Readline();
		while (!email1.equals(email2)) {
			UIimpl.PutLine("Not matching emails, please enter your email address:");
			email1 = UIimpl.Readline();
			UIimpl.PutLine("Please re-enter your email address:");
			email2 = UIimpl.Readline();
		}
		return new Student(StudentID, first_name, last_name, email1, StudentID);

	}	   

	//input : StudentID
	//output: chosen Homework
	public static Homework screen2(String StudentID)
	{
		UIimpl.PutLine("Select homework to submit answers");

		//All homeworks that are not complete are shown as options to select. When a student is in the process of completing.
		//an assignment, it is not considered submitted. 
		
		//Currently, you cannot jump from question to question, this is something we should look at in the future and make sure
		//a student can partially answer a question and then come back and revisit the question after they got some help.
		ArrayList<Homework> res = handler.ExecuteHomework("select * from homework where idhomework in (select distinct idhomework from " +
				"(select idhomework, idquestion from question " +
				"EXCEPT " +
				"select idhomework, idquestion from submission where idstudent = '" + StudentID + "' order by idhomework, idquestion) as a)");

		//display the homeworks available to the students
		for (int i = 0; i < res.size(); i++) {
			Homework array_element = res.get(i);
			UIimpl.PutLine((i+1) + ". " + array_element.displayHeader());
		}

		UIimpl.PutLine("0. Quit Program");

		//Allow the user to select which homework they want to work on.
		int choice = 0;

		try{
			choice = new Integer(UIimpl.Readline());

		} catch (NumberFormatException e) {
			UIimpl.PutLine("Enter the number corresponding to the homework you with to work on:");
			return screen2(StudentID);
		}

		if (choice == 0) {
			System.exit(0);
		}

		return res.get(choice-1);
	}

	//input : homework
	//output chosen question
	public static Question screen3(int homeworkID,String StudentID)
	{
		UIimpl.PutLine("Select question to submit answer");

		//We select only the questions that do not have a submision. Therefore, if a student partially submitted a question, it 
		//will not show again. This is something to improve upon in the future.
		ArrayList<Question> res = handler.ExecuteQuestion("select * from question where (idhomework = '" + homeworkID + "' and " + "idquestion not in " +
				"(Select idquestion from submission where idstudent = '" + StudentID +"' and idhomework = '" + homeworkID + "')) order by idquestion;");

		//Loop through the questions and display each one
		for (int i = 0; i < res.size(); i++) {
			Question array_element = res.get(i);
			UIimpl.PutLine((i+1) + ". " + array_element.displayHeader());
		}

		UIimpl.PutLine("0. Return to previous menu");

		//Pick a question to work on
		int choice = 0;

		try{
			choice = new Integer(UIimpl.Readline());

		} catch (NumberFormatException e) {
			UIimpl.PutLine("Put a number please:");
			return screen3(homeworkID,StudentID);
		}

		if (choice == 0) {
			return screen3(screen2(StudentID).getIDHomework(), StudentID);
		}

		return res.get(choice-1);

	}

	//input : question
	//output chosen res
	public static void screen4a(Question question,String StudentID)
	{
		UIimpl.PutLine(question.displayHeader());
		UIimpl.PutLine(question.getDescription());
		//This may seem trivial, but we want to make sure they want to submit a solution and it's not a accident.
		UIimpl.PutLine("Are you sure you wish to submit a solution to this question?(Y/N)");
		//String[] possibleinput = new String[] {"Y","N","yes","no"};

		String input = UIimpl.Readline();

		while(!input.equalsIgnoreCase("n") && !input.equalsIgnoreCase("y") && !input.equalsIgnoreCase("no") && !input.equalsIgnoreCase("yes"))
		{
			UIimpl.PutLine("Wrong input!");
			UIimpl.PutLine("Are you sure you wish to submit a solution to this question?(Y/N)");
			input = UIimpl.Readline();
		}

		//if you said no, ask for a new question to submit
		if (input.equalsIgnoreCase("n") || input.equalsIgnoreCase("no")) {
			screen4a(screen3(question.getIdhomework(), StudentID),StudentID);
		}
		//otherwise enter your solutions
		else {
			UIimpl.PutLine("Please enter your solution.");
			String response = UIimpl.Readline();
			
			//store their proposed solution in our response table
			try {

				manager.request(Connection ,"insert into response(responsedesc) values("+ "'" +response + "');");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			// Superficially, it seems this is not the way to do things, since the response could be the same from multiple users
			// It seems like this is fine, since if they are the same it doesn't matter. 
			String responseid = handler.ExecuteColumn("select idresponse from response where responsedesc = '" + response + "';", "idresponse").get(0);
			Response res = new Response(new Integer(responseid), response);

			//If there is a syntax error, you do not lose any points and you are reasked the question. 
			//Since we didn't enter a submission, you can revisit this question if you quit.
			try {
				screen4b(res, StudentID, question);
			} catch (SQLException e) {
				UIimpl.PutLine("Your query contains syntaxical error");
				screen4a(question,StudentID);
			}

		}
	}

	//input : question
	//output chosen res
	public static void screen4b(Response response, String StudentID, Question question) throws SQLException
	{ 
		
		HashMap<Dataset,String> failing = new HashMap<Dataset,String>();

		//Check if any datasets fail
		failing = getFailingDatasets(question.getIdhomework(),response.getResponsedesc(), question.getSolution());
		
		int isCorrect = 0;

		//If empty, the proposed solution is correct.
		if (failing.isEmpty()) {
			isCorrect = 1;
		}
		else
		{
			//otherwise subtract points for an incorrect answer. These are stored as values in the DB so they can be changeed
			//from homework to homework
			question.substractDataset();
		}

		//Track the results. Now a student must complete the question before moving on to another question.
		//This is something we should revisit.
		try {
			manager.request(Connection ,"insert into submission(idstudent,idhomework,idquestion,iscorrect,idresponse) values('" + StudentID + "'," 
					+ question.getIdhomework() 
					+ "," + question.getIDQuestion() 
					+ "," + isCorrect + "," + response.getIdresponse() + ");");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		//If the user failed and points still exist for the question, then give the student options for how to proceed.
		if ((!failing.isEmpty()) && (question.getPoints() > 0)) {
			
			UIimpl.PutLine("You answer does not match our solution. " +
					"You have just lost " + question.getDataSetPoints() + " points and have " + question.getPoints() + " remaining points if you solve the problem correctly next time. Your options are:");

			UIimpl.PutLine("1.Submit a new answer");

			UIimpl.PutLine("2. Request the data of that your query failed on. This will cost you " + question.getDataSetPoints() + " point(s).");
			
			UIimpl.PutLine("3. Request the data set and the result set of the correct answer for the data set that you failed upon. This will cost you " + question.getResultSetPoints() + " point(s).");

			UIimpl.PutLine("0. Return to previous menu");

			int choice = 0;

			try{
				choice = new Integer(UIimpl.Readline());

			} catch (NumberFormatException e) {
				UIimpl.PutLine("Put a number please:");
			}
			ArrayList<DataSetInfo> infos = handler.GetTableName("select * from DataSetInfo where idhomework = '" + question.getIdhomework() + "' and idquestion = '" + question.getIDQuestion() + "';");
			switch (choice) {
			case 1:
				//Simply submit a new answer. Nothing special here.

				screen4a(question, StudentID);

				break;

			case 2:
				
				int i = 1;
				
				for (Dataset dataset : failing.keySet()) {
					UIimpl.PutLine( "Dataset " + i + ". " + dataset.PrintContent(infos));
					i++;
				}

				question.substractDataset();
				
				screen4a(question, StudentID);

				break;
				
			case 3:
				
				int j = 1;
				
				for(Entry<Dataset, String> entry : failing.entrySet()){
					UIimpl.PutLine( "Dataset: " + j + ". " + entry.getKey().PrintContent(infos));
					UIimpl.PutLine( "Right output: " + j + ". " + entry.getValue());
					j++;
				}

				question.substractDataset();
				
				screen4a(question, StudentID);
				break;
				
			case 0:

				screen4a(screen3(question.getIdhomework(), StudentID),StudentID);

				break;

			default:
				break;
			}
		}
		screen4a(screen3(question.getIdhomework(), StudentID),StudentID);
	}

	public static HashMap<Dataset, String> getFailingDatasets(int idhomework, String response, String solution) throws SQLException
	{
		HashMap<Dataset, String> failing = new HashMap<Dataset, String>();
		ArrayList<Dataset> datasets = handler.ExecuteDataset("select * from datasets where idhomework = " + idhomework);

		//loop through all the datasets for this homework
		//For each dataset, connect to the appropriate database with the correct credentials
		for (Dataset dataset : datasets) {
			ConnectionManager database = new ConnectionManager(dataset.getDatasetdata());

			//get the results of the student's proposed solution
			String outputUserResponse = database.request(database.newConnection(), response);
			
			//get the results of the correct solutions
			String outputSolution = database.request(database.newConnection(), solution);

			//We compare output assuming that the query is ordered so that every result column is specified.
			if (!outputSolution.equalsIgnoreCase(outputUserResponse)) {
				failing.put(dataset,outputSolution);
			}

		}

		return failing;

	}

}
