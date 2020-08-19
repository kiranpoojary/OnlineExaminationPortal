package oep.coe;

import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;

import oep.regandlog.SendMail;

public class CoeAddOperation {

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

	public boolean addCourse(String course, String ctype, HttpServletRequest request) {

		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertInstuQuery = "insert into courses (InstuID,courseName,courseType) values(?,?,?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertInstuQuery);
			HttpSession session = request.getSession();
			insertStatement.setString(1, session.getAttribute("instuID").toString());
			insertStatement.setString(2, course);
			insertStatement.setString(3, ctype);

			int insertInstu = insertStatement.executeUpdate();
			if (insertInstu == 1) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;

	}
	
	public boolean getCourseExist(int instuID, String courseName) {

		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String existStudentQ = "SELECT COUNT(courseName) from courses where instuID=? AND courseName=?";
			PreparedStatement getID = (PreparedStatement) connection.prepareStatement(existStudentQ);
			getID.setInt(1, instuID);
			getID.setString(2, courseName);
			ResultSet idResult = getID.executeQuery();
			idResult.next();
			if(idResult.getInt(1)==0)
			{
				return false;
			} else {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	
	
	public int getCourseID(int instuID, String courseName) {

		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String existStudentQ = "SELECT courseID from courses where instuID=? AND courseName=?";
			PreparedStatement getID = (PreparedStatement) connection.prepareStatement(existStudentQ);
			getID.setInt(1, instuID);
			getID.setString(2, courseName);
			ResultSet idResult = getID.executeQuery();
			if(idResult.next())
			{
				return idResult.getInt(1);
			} else {
				return 0;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}
	
	
	public boolean addCourseSem(int courseID, String semName) {

		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertSemQuery = "insert into coursesemister(courseID,semName) values(?,?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertSemQuery);
			insertStatement.setInt(1, courseID);
			insertStatement.setString(2, semName);

			int insertSem = insertStatement.executeUpdate();
			if (insertSem == 1) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;

	}
	
	
	
	
	



	public boolean addSubject(String subjectCode, String subjectName, int courseID, String subjectLecture,
			String subjectType, HttpServletRequest request) {
		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertInstuQuery = "insert into subjects(subjectID,subjectname,teacherID,semID,subjectType) values(?,?,?,?,?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertInstuQuery);
			HttpSession session = request.getSession(true);
			insertStatement.setString(1, subjectCode);
			insertStatement.setString(2, subjectName);
			insertStatement.setString(3, subjectLecture);
			insertStatement.setInt(4, courseID);
			insertStatement.setString(5, subjectType);

			int insertSubject = insertStatement.executeUpdate();
			if (insertSubject == 1) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;

	}

	public boolean addTeacher(String TID, String instuID, String fName, String tmpPsw, String mob, String instuName) {
		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertInstuQuery = "insert into teachers(teacherID,InstuID,fullName,password,mobile) values(?,?,?,?,?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertInstuQuery);
			SendMail studentNotify = new SendMail();

			insertStatement.setString(1, TID);
			insertStatement.setString(2, instuID);
			insertStatement.setString(3, fName);
			insertStatement.setString(4, tmpPsw);
			insertStatement.setString(5, mob);

			int insertTeacher = insertStatement.executeUpdate();
			if (insertTeacher == 1) {
				studentNotify.mailNow(TID, fName, instuName, "Teacher", TID, tmpPsw);
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;

	}

	
	public boolean getTeacherExist(String teacherID) {

		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String existTeacherQ = "SELECT COUNT(teacherID) from teachers where teacherID=?";
			PreparedStatement getID = (PreparedStatement) connection.prepareStatement(existTeacherQ);
			getID.setString(1, teacherID);
			ResultSet idResult = getID.executeQuery();
			idResult.next();
			if(idResult.getInt(1)==0)
			{
				return false;
			} else {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	
	
	
	
	public boolean addStudent(String instuID, String stuReg, String fName, String tmpPsw, int courseID, String email,
			String instuName) {
		try {
			SendMail studentNotify = new SendMail();

			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertInstuQuery = "insert into students(instuID,studentReg,fullName,password,courseSemID,emailID) values(?,?,?,?,?,?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertInstuQuery);

			insertStatement.setString(1, instuID);
			insertStatement.setString(2, stuReg);
			insertStatement.setString(3, fName);
			insertStatement.setString(4, tmpPsw);
			insertStatement.setInt(5, courseID);
			insertStatement.setString(6, email);

			int insertStudent = insertStatement.executeUpdate();
			if (insertStudent > 0) {
				studentNotify.mailNow(email, fName, instuName, "Student", stuReg, tmpPsw);
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;

	}
	
	
	
	
	
	public boolean getStudentExist(int instuID, String reg) {

		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String existStudentQ = "SELECT COUNT(studentReg) from students where instuID=? AND studentReg=?";
			PreparedStatement getID = (PreparedStatement) connection.prepareStatement(existStudentQ);
			getID.setInt(1, instuID);
			getID.setString(2, reg);
			ResultSet idResult = getID.executeQuery();
			idResult.next();
			if(idResult.getInt(1)==0)
			{
				return false;
			} else {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	
	
	
	
	
	

	public boolean scheduleExam(String instuID, String subjectID, String testName, String examDate, String examTime,
			int duration, int marks, String status, String instuName) {
		try {
			String examID = instuID + subjectID + testName;
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertInstuQuery = "insert into exams(examID,InstuID,subjectID,testName,date,examTime,duration,totMarks,status) values(?,?,?,?,?,?,?,?,?)";
			SendMail notifyTeacher = new SendMail();
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertInstuQuery);
			insertStatement.setString(1, examID);
			insertStatement.setString(2, instuID);
			insertStatement.setString(3, subjectID);
			insertStatement.setString(4, testName);
			insertStatement.setString(5, examDate);
			insertStatement.setString(6, examTime);
			insertStatement.setInt(7, duration);
			insertStatement.setInt(8, marks);
			insertStatement.setString(9, status);

			int insertedExam = insertStatement.executeUpdate();
			if (insertedExam == 1) {
				String selectQuery = "SELECT t.fullName,t.teacherID FROM teachers t,subjects s,exams e WHERE s.subjectID=e.subjectID AND t.teacherID=s.teacherID AND s.subjectID=?;";

				PreparedStatement selectStatement = (PreparedStatement) connection.prepareStatement(selectQuery);
				selectStatement.setString(1, subjectID);
				ResultSet name = selectStatement.executeQuery();
				name.next();

				notifyTeacher.mailNow(name.getString(2), name.getString(1), instuName, examDate, subjectID, testName);
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;

	}

	public boolean scanUpload(String studID, String examID, InputStream scanCopy) {

		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertInstuQuery = "UPDATE answerdescriptive SET scannedAns=? WHERE studID=? AND examID=? AND qNo IN( SELECT MAX(qNo) from answerdescriptive WHERE studID=? AND examID=?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertInstuQuery);
			insertStatement.setBlob(1, scanCopy);
			insertStatement.setString(2, studID);
			insertStatement.setString(3, examID);
			insertStatement.setString(4, studID);
			insertStatement.setString(5, examID);
// SELECT MAX(qNo) from answerdescriptive WHERE studID='PESBCA1101' AND examID='100117BCA12020001BCA1ISA1' 

			int updatedCount = insertStatement.executeUpdate();
			if (updatedCount > 0) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public boolean promoteStudents(int instuID, int current, int promote) {

		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			String existStudentQ = "SELECT COUNT(fullName) from students where courseSemID=?";
			PreparedStatement getCount = (PreparedStatement) connection.prepareStatement(existStudentQ);
			getCount.setInt(1, promote);
			ResultSet countExist = getCount.executeQuery();
			countExist.next();
			if (countExist.getInt(1)>0) {
				
				return false;
			} else {
				
				String updateCourseQuery = "UPDATE students SET courseSemID=? WHERE instuID=? AND courseSemID=?";
				PreparedStatement updateStatement = (PreparedStatement) connection.prepareStatement(updateCourseQuery);
				updateStatement.setInt(1, promote);
				updateStatement.setInt(2, instuID);
				updateStatement.setInt(3, current);

				int updatedCount = updateStatement.executeUpdate();
				if (updatedCount > 0) {
					return true;
				} else {
					return false;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	
	
	
	
	
	
	
	
	public boolean updateStudentInfo(int instuID, String reg, String fullName, int course,String email,String oldReg) {

		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			
				String updateQuery = "UPDATE students SET studentReg=?,fullName=?,courseSemID=?,emailID=? WHERE instuID=? AND studentReg=?";
				PreparedStatement updateStatement = (PreparedStatement) connection.prepareStatement(updateQuery);
				updateStatement.setString(1, reg);
				updateStatement.setString(2, fullName);
				updateStatement.setInt(3, course);
				updateStatement.setString(4, email);
				updateStatement.setInt(5, instuID);
				updateStatement.setString(6, oldReg);

				int updatedCount = updateStatement.executeUpdate();
				if (updatedCount > 0) {
					return true;
				} else {
					
					return false;
				}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	
	
	
	
	


}
