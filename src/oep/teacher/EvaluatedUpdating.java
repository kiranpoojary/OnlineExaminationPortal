package oep.teacher;

import java.sql.DriverManager;

import com.mysql.jdbc.PreparedStatement;

public class EvaluatedUpdating {
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
	
	
	
	public boolean evaluateFill(String stdReg, String examID, int qNo, int marks) {
		try
		{
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertMCQAnswer = "update answerdescriptive SET marks=?,evalStatus=? WHERE studID=? AND examID=? AND qNo=?";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertMCQAnswer);
			insertStatement.setInt(1,marks);
			insertStatement.setString(2,"Evaluated");
			insertStatement.setString(3,stdReg);
			insertStatement.setString(4,examID);
			insertStatement.setInt(5,qNo);
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

	public boolean evaluateDescriptive(String stdReg, String examID, int qNo, int marks,String comments) {
		try
		{
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertMCQAnswer = "update answerdescriptive SET marks=?,comments=?,evalStatus=? WHERE studID=? AND examID=? AND qNo=?";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertMCQAnswer);
			insertStatement.setInt(1,marks);
			insertStatement.setString(2,comments);
			insertStatement.setString(3,"Evaluated");
			insertStatement.setString(4,stdReg);
			insertStatement.setString(5,examID);
			insertStatement.setInt(6,qNo);
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
