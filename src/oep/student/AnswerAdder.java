package oep.student;

import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;

public class AnswerAdder {
	static String dbUrl;
	static String driverName;
	int mx;
	static java.sql.Connection connection;

	static {

		try {
			dbUrl = "jdbc:mysql://localhost/oep_db";
			driverName = "com.mysql.jdbc.Driver";
			Class.forName(driverName);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public boolean addMCQAnswer(String stdReg, String examID, int qNo, String answer, int marks) {
		try
		{
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertMCQAnswer = "insert into answermcq(studID,examID,qNo,anwer,marks) values(?,?,?,?,?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertMCQAnswer);
			insertStatement.setString(1,stdReg);
			insertStatement.setString(2,examID);
			insertStatement.setInt(3,qNo);
			insertStatement.setString(4,answer);
			insertStatement.setInt(5,marks);

			int inserted = insertStatement.executeUpdate();
			if(inserted>0)
			{
				return true;
			}
			
			
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;	
		}
		
		return false;
	}

	public boolean addFillAnswer(String stdReg, String examID, int qNo, String answer, int marks) {
		try
		{
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertFillAnswer = "insert into answerdescriptive(studID,examID,qNo,ansTyped,marks) values(?,?,?,?,?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertFillAnswer);
			insertStatement.setString(1,stdReg);
			insertStatement.setString(2,examID);
			insertStatement.setInt(3,qNo);
			insertStatement.setString(4,answer);
			insertStatement.setInt(5,marks);
			int inserted = insertStatement.executeUpdate();
			if(inserted>0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;	
		}	
		
	}

	
	
	public boolean addDescriptiveAnswer(String stdReg, String examID, int qNo, String answer, int marks) {
		try
		{
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertDescrAnswer = "insert into answerdescriptive(studID,examID,qNo,ansTyped,marks) values(?,?,?,?,?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertDescrAnswer);
			insertStatement.setString(1,stdReg);
			insertStatement.setString(2,examID);
			insertStatement.setInt(3,qNo);
			insertStatement.setString(4,answer);
			insertStatement.setInt(5,marks);
			int inserted = insertStatement.executeUpdate();
			if(inserted>0)
			{
				return true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;	
		}
		
		return false;
		
	}

}
