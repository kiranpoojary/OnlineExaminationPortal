package oep.coe;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Random;

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
 * Servlet implementation class ReadStudentExcelFile
 */
@WebServlet("/ReadStudentExcelFile")
@MultipartConfig(maxFileSize = 16177216) // 1.5MB
public class ReadStudentExcelFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReadStudentExcelFile() {
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
		String instuName=session.getAttribute("instuName").toString();
		Random generator = new Random();
		String tmpPsw=new String();
		int instuID = Integer.parseInt(session.getAttribute("instuID").toString());
		int courseID = Integer.parseInt( request.getParameter("course"));
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

		if (request.getParameter("students") != null) {
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
							if (cell.getStringCellValue().equals("Reg No.")) {
								validHeader = true;
								cell = cellIterator.next();
								if (cell.getStringCellValue().equals("Full Name")) {
									validHeader = true;
									cell = cellIterator.next();
									if (cell.getStringCellValue().equals("Email")) {
										validHeader = true;
										CoeAddOperation add = new CoeAddOperation();
										String regNo = new String();
										String fullName = new String();
										String email = new String();
										while (itr.hasNext()) { // if next row exist
											Integer psw = 100000 + generator.nextInt(900000);
											tmpPsw=psw.toString();
											row = itr.next();
											cellIterator = row.cellIterator(); // iterating over each column
											if (cellIterator.hasNext()) {
												cell = cellIterator.next();
												regNo = cell.getStringCellValue();
												cell = cellIterator.next();
												fullName = cell.getStringCellValue();
												cell = cellIterator.next();
												email = cell.getStringCellValue();

												System.out.println(regNo + fullName + email);
												if (!add.getStudentExist(instuID, regNo)) {
													if (add.addStudent(session.getAttribute("instuID").toString(),regNo, fullName,tmpPsw,courseID,email,instuName)) {
														

														out.print("<script>");
														out.print("alert('All Student Details Added Successfuly');");
														out.print(
																"window.location.href='../OEP/production/addStudents.jsp';");
														out.print("</script>");
													} else {
														out.print("<script>");
														out.print(
																"alert('Something went wrong while adding student Register No. :"+regNo+" check network connection ');");
														out.print(
																"window.location.href='../OEP/production/addStudents.jsp';");
														out.print("</script>");
													}
												}
												else {
													out.print("<script>");
													out.print(
															"alert(' Register No. :"+regNo+" Already Exist.');");
													out.print(
															"window.location.href='../OEP/production/addStudents.jsp';");
													out.print("</script>");
												}
												

											}
											// System.out.println("inserted");
										}
										out.print("<script>");
										out.print("window.location.href='../OEP/production/addStudents.jsp';");
										out.print("</script>");
									} else
										validHeader = false;
								} else
									validHeader = false;
							} else if (!validHeader) {
								out.print("<script>");
								out.print(
										"alert('Data Error(column Headers should be : Reg No. | Full Name | Email');");
								out.print("window.location.href='../OEP/production/addStudents.jsp';");
								out.print("</script>");

							}

						} else {
							out.print("<script>");
							out.print("alert('File has no data');");
							out.print("window.location.href='../OEP/production/addStudents.jsp';");
							out.print("</script>");
						}
					} else {
						out.print("<script>");
						out.print("alert('File has no data');");
						out.print("window.location.href='../OEP/production/addStudents.jsp';");
						out.print("</script>");

					}

				} else {
					out.print("<script>");
					out.print("alert('File Not Supported(only .xlsx and xls)');");
					out.print("window.location.href='../OEP/production/addStudents.jsp';");
					out.print("</script>");
				}
			} catch (Exception e) {
				e.printStackTrace();
				out.print("<script>");
				out.print("alert('Something Went Wrong!!. Try Again');");
				out.print("window.location.href='../OEP/production/addStudents.jsp';");
				out.print("</script>");
			}
		} else {
			if (true) {
				out.print("<script>");
				out.print("alert('No Operation');");
				out.print("window.location.href='../OEP/production/addStudents.jsp';");
				out.print("</script>");
			}
		}

	}

}
