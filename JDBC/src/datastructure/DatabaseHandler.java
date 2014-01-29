package datastructure;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import sqlConnection.ConnectionManager;

public class DatabaseHandler {

	public DatabaseHandler(ConnectionManager manager) {
		super();
		this.manager = manager;
	}

	private ConnectionManager manager;
	
	public ArrayList<Homework> ExecuteHomework(String sql)
	{
		ArrayList<Homework> list = new ArrayList<Homework>();

		Statement stmt;
		try {
			stmt = manager.getFirst().createStatement();

		ResultSet rset = stmt.executeQuery(sql);
		
		// Fetch each row from the result set
		while (rset.next()) {
			int id = rset.getInt("idhomework");
			String assignment = rset.getString("assignment");
			String duedate = rset.getString("duedate");
			String latedate = rset.getString("latedate");
			int latepenality = rset.getInt("latepenality");

			//Assuming you have a user object
			Homework homework = new Homework(id, assignment,duedate,latedate,latepenality);

			list.add(homework);
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	
	public ArrayList<Question> ExecuteQuestion(String sql)
	{
		ArrayList<Question> list = new ArrayList<Question>();

		Statement stmt;
		try {
			stmt = manager.getFirst().createStatement();

		ResultSet rset = stmt.executeQuery(sql);

		// Fetch each row from the result set
		while (rset.next()) {
			int idhomework = rset.getInt("idhomework");
			int idquestion = rset.getInt("idquestion");
			String description = rset.getString("description");
			String solution = rset.getString("solution");
			int points = rset.getInt("points");
			int datasetPoints = rset.getInt("datasetpoints");
			int penalitypoints = rset.getInt("penalitypoints");
			int resultsetPoints = rset.getInt("resultsetpoints");

			//Assuming you have a user object
			Question question = new Question(idhomework ,idquestion, description, solution, points, penalitypoints, datasetPoints, resultsetPoints);

			list.add(question);
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	
	
	public ArrayList<Dataset> ExecuteDataset(String sql)
	{
		ArrayList<Dataset> list = new ArrayList<Dataset>();

		Statement stmt;
		try {
			stmt = manager.getFirst().createStatement();

		ResultSet rset = stmt.executeQuery(sql);

		// Fetch each row from the result set
		while (rset.next()) {
			int idhomework = rset.getInt("idhomework");
			int iddataset = rset.getInt("iddataset");
			String datasetdata = rset.getString("datasetdata");

			//Assuming you have a user object
			Dataset dataset = new Dataset(idhomework ,iddataset, datasetdata);

			list.add(dataset);
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	
	public ArrayList<String> ExecuteColumn(String sql, String ColumnName)
	{
		ArrayList<String> list = new ArrayList<String>();

		Statement stmt;
		try {
			stmt = manager.getFirst().createStatement();

		ResultSet rset = stmt.executeQuery(sql);
		
		// Fetch each row from the result set
		while (rset.next()) {
			String content = rset.getString(ColumnName);

			list.add(content);
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList<DataSetInfo> GetTableName(String sql) {
		ArrayList<DataSetInfo> list = new ArrayList<DataSetInfo>();

		Statement stmt;
		try {
			stmt = manager.getFirst().createStatement();

		ResultSet rset = stmt.executeQuery(sql);

		// Fetch each row from the result set
		while (rset.next()) {
			int idhomework = rset.getInt("idhomework");
			int idquestion = rset.getInt("idquestion");
			String tablename = rset.getString("tablename");

			//Assuming you have a user object
			DataSetInfo dataset = new DataSetInfo(idhomework ,idquestion, tablename);

			list.add(dataset);
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	
}
