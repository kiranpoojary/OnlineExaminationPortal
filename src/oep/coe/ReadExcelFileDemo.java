package oep.coe;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * Servlet implementation class ReadExcelFileDemo
 */
@WebServlet("/ReadExcelFileDemo")
@MultipartConfig(maxFileSize = 16177216) // 1.5MB
public class ReadExcelFileDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReadExcelFileDemo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		int instuID = Integer.parseInt(session.getAttribute("instuID").toString());
		Part part = request.getPart("xlSheet");
		String disposition = part.getHeader("Content-Disposition");
		String fileName = disposition.replaceFirst("(?i)^.*filename=\"?([^\"]+)\"?.*$", "$1");
		int i = fileName.lastIndexOf('.');
		String extension = "";
		InputStream fileStream = null;
		fileStream = part.getInputStream();
		Row row = null;
		Iterator<Cell> cellIterator = null;
		Cell cell = null;
		boolean validHeader = false;
		if (i > 0) {
			extension = fileName.substring(i + 1);
		}

		if (request.getParameter("course") != null) {
			try {
				if (extension.equals("xls") || extension.equals("xlsx")) {
					XSSFWorkbook wb = new XSSFWorkbook(fileStream);
					XSSFSheet sheet = wb.getSheetAt(0); // creating a Sheet object to retrieve object
					Iterator<Row> itr = sheet.iterator(); // iterating over excel file

					if (itr.hasNext()) {
						row = itr.next();
						cellIterator = row.cellIterator(); // iterating over each column
						if (cellIterator.hasNext()) {
							cell = cellIterator.next();
							if (cell.getStringCellValue().equals("Course Name")) {
								validHeader = true;
								cell = cellIterator.next();
								if (cell.getStringCellValue().equals("Course type")) {
									validHeader = true;
									cell = cellIterator.next();
									if (cell.getStringCellValue().equals("Total Sem")) {
										validHeader = true;
										CoeAddOperation add = new CoeAddOperation();
										String courseName = new String();
										String courseType = new String();
										int totalSem = 0;
										while (itr.hasNext()) { // if next row exist
											row = itr.next();
											cellIterator = row.cellIterator(); // iterating over each column
											if (cellIterator.hasNext()) {
												cell = cellIterator.next();
												courseName = cell.getStringCellValue();
												cell = cellIterator.next();
												courseType = cell.getStringCellValue();
												cell = cellIterator.next();
												totalSem = (int) cell.getNumericCellValue();
												System.out.println(courseName + courseType + totalSem);

												if (!add.getCourseExist(instuID, courseName)) {
													if (add.addCourse(courseName, courseType, request)) {
														int courseID = add.getCourseID(instuID, courseName);
														for (int sem = 1; sem <= totalSem; sem++) {
															if (!add.addCourseSem(courseID,
																	courseName + "-SEM" + sem)) {
																out.print("<script>");
																out.print(
																		"alert('Something wrong while adding semesters');");
																out.print(
																		"window.location.href='../OEP/production/addCourses.jsp';");
																out.print("</script>");
															}
														}
														out.print("<script>");
														out.print("alert('Course And Semester Added Successfuly ');");
														out.print(
																"window.location.href='../OEP/production/addCourses.jsp';");
														out.print("</script>");
													} else {
														out.print("<script>");
														out.print(
																"alert('Something went wrong while adding courses');");
														out.print(
																"window.location.href='../OEP/production/addCourses.jsp';");
														out.print("</script>");
													}

												} else {
													out.print("<script>");
													out.print("alert('The Course " + courseName
															+ " in your file is already added');");
													out.print(
															"window.location.href='../OEP/production/addCourses.jsp';");
													out.print("</script>");
												}

											}
											// System.out.println("inserted");
										}
										out.print("<script>");
										out.print("window.location.href='../OEP/production/addCourses.jsp';");
										out.print("</script>");
									} else
										validHeader = false;
								} else
									validHeader = false;
							} else if (!validHeader) {
								out.print("<script>");
								out.print(
										"alert('Data Error(column Headers should be : Course Name | Course Type | Total Sem');");
								out.print("window.location.href='../OEP/production/addCourses.jsp';");
								out.print("</script>");

							}

						} else {
							out.print("<script>");
							out.print("alert('File has no data');");
							out.print("window.location.href='../OEP/production/addCourses.jsp';");
							out.print("</script>");
						}
					} else {
						out.print("<script>");
						out.print("alert('File has no data');");
						out.print("window.location.href='../OEP/production/addCourses.jsp';");
						out.print("</script>");

					}

				} else {
					out.print("<script>");
					out.print("alert('File Not Supported(only .xlsx and xls)');");
					out.print("window.location.href='../OEP/production/addCourses.jsp';");
					out.print("</script>");
				}
			} catch (Exception e) {
				e.printStackTrace();
				out.print("<script>");
				out.print("alert('Something Went Wrong!!. Try Again');");
				out.print("window.location.href='../OEP/production/addCourses.jsp';");
				out.print("</script>");
			}
		} else {
			if (true) {
				out.print("<script>");
				out.print("alert('No Operation');");
				out.print("window.location.href='../OEP/production/addCourses.jsp';");
				out.print("</script>");
			}
		}

	}

}
