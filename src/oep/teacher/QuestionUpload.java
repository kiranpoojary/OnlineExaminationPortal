package oep.teacher;

import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class QuestionUpload {

	static String dbUrl;
	static String driverName;
	int mx;
	static java.sql.Connection connection;

	static {

		try {
			dbUrl = "jdbc:mysql://localhost/oep_db";
			driverName = "com.mysql.jdbc.Driver";
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}

	}

	public boolean uploadMCQ(String testID, String mcqQ, String optA, String optB, String optC, String optD,
			String optAns, int mark, String type) {
		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertInstuQuery = "insert into questionmcq(examID,question,choiceA,choiceB,choiceC,choiceD,ansChoice,marks,type) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertInstuQuery);

			insertStatement.setString(1, testID);
			insertStatement.setString(2, mcqQ);
			insertStatement.setString(3, optA);
			insertStatement.setString(4, optB);
			insertStatement.setString(5, optC);
			insertStatement.setString(6, optD);
			insertStatement.setString(7, optAns);
			insertStatement.setInt(8, mark);
			insertStatement.setString(9, type);

			int insertMCQ = insertStatement.executeUpdate();
			if (insertMCQ == 1) {
				setUploadStatus(testID);
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;

	}

	public boolean uploadFill(String testID, String fillQ, String fillAns, int fillmark, String type) {
		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertInstuQuery = "insert into questiondescriptive(examID,question,expectedAns,marks,type ) values(?,?,?,?,?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertInstuQuery);

			insertStatement.setString(1, testID);
			insertStatement.setString(2, fillQ);
			insertStatement.setString(3, fillAns);
			insertStatement.setInt(4, fillmark);
			insertStatement.setString(5, type);

			int insertFill = insertStatement.executeUpdate();
			if (insertFill == 1) {
				setUploadStatus(testID);
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;

	}
	
	
	
	public boolean uploadDescriptive(String testID, String fillQ, String fillAns, int fillmark, String type) {
		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertInstuQuery = "insert into questiondescriptive(examID,question,expectedAns,marks,type ) values(?,?,?,?,?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertInstuQuery);

			insertStatement.setString(1, testID);
			insertStatement.setString(2, fillQ);
			insertStatement.setString(3, fillAns);
			insertStatement.setInt(4, fillmark);
			insertStatement.setString(5, type);

			int insertFill = insertStatement.executeUpdate();
			if (insertFill == 1) {
				setUploadStatus(testID);
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;

	}
	
	
	public void setUploadStatus(String testID)
	{
		int maxMarks = 0;
		int uploadedMarks = 0;
		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String getTotMarks = "SELECT totMarks FROM exams WHERE examID=?";
			PreparedStatement ps2 = (PreparedStatement) connection.prepareStatement(getTotMarks);
			ps2.setString(1, testID);
			ResultSet totM=ps2.executeQuery();
			totM.next();
			maxMarks=totM.getInt(1);
	
			
			String getUpMarks = "SELECT (SELECT SUM(marks) FROM questionmcq WHERE examID=?) + (SELECT SUM(marks)" + " FROM questiondescriptive WHERE examID=?) as totQ";
			PreparedStatement ps3 = (PreparedStatement) connection.prepareStatement(getUpMarks);
			ps3.setString(1, testID);
			ps3.setString(2, testID);
			ResultSet totUpM=ps3.executeQuery();
			totUpM.next();
			
			uploadedMarks=totUpM.getInt(1);
			String upStatus;
			if(maxMarks==uploadedMarks)
			{
				upStatus="Finished";
				
			}
			else
			{
				upStatus="Upload Pending";
			}
			
			String updateQ = "UPDATE exams SET status=? WHERE examID=?";
			PreparedStatement ps4 = (PreparedStatement) connection.prepareStatement(updateQ);
			ps4.setString(1, upStatus);
			ps4.setString(2, testID);
			ps4.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
			
		}


		
			
	}

}
