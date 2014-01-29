package datastructure;

import java.sql.SQLException;

import sqlConnection.ConnectionManager;

public class Student {
	private String IDStudent;
	private String FirstName;
	private String LastName;
	private String EmailAddress;
	private String UserID;

	public Student(String iDStudent, String firstName, String lastName,
			String emailAddress, String userID) {
		super();
		IDStudent = iDStudent;
		FirstName = firstName;
		LastName = lastName;
		EmailAddress = emailAddress;
		UserID = userID;
	}
	
	public int AddtoDatabase(ConnectionManager manager, int connection)
	{
		try {
			manager.request(connection ,"insert into students values('" + this.IDStudent + "','" 
																		+ this.FirstName + "','" 
																		+ this.LastName + "','" 
																		+ this.EmailAddress + "','" 
																		+ this.UserID + "');");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

}
