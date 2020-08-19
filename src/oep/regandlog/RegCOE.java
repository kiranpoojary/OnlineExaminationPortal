package oep.regandlog;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegCOE
 */
@WebServlet("/RegCOE")
public class RegCOE extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegCOE() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			HttpSession session = request.getSession();
			Registration reg = new Registration();
			// Institution Deatails
			String iname = session.getAttribute("iname").toString();
			String addr = session.getAttribute("addr").toString();
			String country = session.getAttribute("country").toString();
			String state = session.getAttribute("state").toString();
			String district = session.getAttribute("district").toString();
			int zip = Integer.parseInt(session.getAttribute("zip").toString());
			String site = session.getAttribute("site").toString();

			
			System.out.println("Hola :"+iname+addr+country+state+district+zip+site);
			// COE Deatails
			String cemail = (String) request.getParameter("cemail");
			String cpsw = request.getParameter("cpsw").toString();
			String secq = request.getParameter("secq").toString();
			String seca = request.getParameter("seca").toString();
			
			System.out.print("Hola2 :"+cemail+cpsw+secq+seca);
			

			boolean complted = reg.institutionRegister(iname, addr, country, state, district, zip, site, cemail, cpsw,
					secq, seca);
			if (complted) {
				PrintWriter out = response.getWriter();

				out.println("<script type=\"text/javascript\">");
				out.println("alert('Registration Successful');");
				out.println("location='LoginCOE.jsp';");
				out.println("</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();
			
			PrintWriter out = response.getWriter();

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Something Went Wrong!.Try again.');");
			out.println("location='LoginCOE.jsp';");
			out.println("</script>");
			
		}

	}

}
