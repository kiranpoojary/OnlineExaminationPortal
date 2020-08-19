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
 * Servlet implementation class ReadTeacherExcelFile
 */
@WebServlet("/ReadTeacherExcelFile")
@MultipartConfig(maxFileSize = 16177216) // 1.5MB
public class ReadTeacherExcelFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReadTeacherExcelFile() {
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
		String instuName = session.getAttribute("instuName").toString();
		Random generator = new Random();
		String tmpPsw = new String();
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

		if (request.getParameter("teacher") != null) {
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
							if (cell.getStringCellValue().equals("Full Name")) {
								validHeader = true;
								cell = cellIterator.next();
								if (cell.getStringCellValue().equals("Mobile No.")) {
									validHeader = true;
									cell = cellIterator.next();
									if (cell.getStringCellValue().equals("Email")) {
										validHeader = true;
										CoeAddOperation add = new CoeAddOperation();
										String fullName = new String();
										long  mobile;	
										String strMobile=new String();
										String email = new String();
										while (itr.hasNext()) { // if next row exist
											Integer psw = 100000 + generator.nextInt(900000);
											tmpPsw = psw.toString();
											row = itr.next();
											cellIterator = row.cellIterator(); // iterating over each column
											if (cellIterator.hasNext()) {
												cell = cellIterator.next();
												fullName = cell.getStringCellValue();
												cell = cellIterator.next();
												mobile =(long) cell.getNumericCellValue();
												strMobile=Long.toString(mobile);
												cell = cellIterator.next();
												email = cell.getStringCellValue();
												
												System.out.println(email+"  "+fullName+"  "+strMobile);
												
												if (!add.getTeacherExist(email)) {
													
													if (add.addTeacher(email,session.getAttribute("instuID").toString(), fullName, tmpPsw,strMobile, instuName)) {

														out.print("<script>");
														out.print("alert('All lecturers Details Added Successfuly');");
														out.print(
																"window.location.href='../OEP/production/addTeachers.jsp';");
														out.print("</script>");
													} else {
														out.print("<script>");
														out.print(
																"alert('Something went wrong while adding Lecturer ID. :"
																		+ email + " check network connection ');");
														out.print(
																"window.location.href='../OEP/production/addTeachers.jsp';");
														out.print("</script>");
													}
													
												} else {
													out.print("<script>");
													out.print("alert('Lecturer ID :" + email + " Already Exist.');");
													out.print(
															"window.location.href='../OEP/production/addTeachers.jsp';");
													out.print("</script>");
												}
												

											}
											
										}
										out.print("<script>");
										out.print("window.location.href='../OEP/production/addTeachers.jsp';");
										out.print("</script>");
									} else
										validHeader = false;
								} else
									validHeader = false;
							} else if (!validHeader) {
								out.print("<script>");
								out.print(
										"alert('Data Error(column Headers should be : Full Name | Mobile No. | Email');");
								out.print("window.location.href='../OEP/production/addTeachers.jsp';");
								out.print("</script>");

							}

						} else {
							out.print("<script>");
							out.print("alert('File has no data');");
							out.print("window.location.href='../OEP/production/addTeachers.jsp';");
							out.print("</script>");
						}
					} else {
						out.print("<script>");
						out.print("alert('File has no data');");
						out.print("window.location.href='../OEP/production/addTeachers.jsp';");
						out.print("</script>");

					}

				} else {
					out.print("<script>");
					out.print("alert('File Not Supported(only .xlsx and xls)');");
					out.print("window.location.href='../OEP/production/addTeachers.jsp';");
					out.print("</script>");
				}
			} catch (Exception e) {
				e.printStackTrace();
				out.print("<script>");
				out.print("alert('Something Went Wrong!!. Try Again');");
				out.print("window.location.href='../OEP/production/addTeachers.jsp';");
				out.print("</script>");
			}
		} else {
			if (true) {
				out.print("<script>");
				out.print("alert('No Operation');");
				out.print("window.location.href='../OEP/production/addTeachers.jsp';");
				out.print("</script>");
			}
		}
	}

}
