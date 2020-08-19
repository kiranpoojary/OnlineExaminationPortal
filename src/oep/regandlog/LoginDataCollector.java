package oep.regandlog;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginDataCollector
 */
@WebServlet("/LoginDataCollector")
public class LoginDataCollector extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginDataCollector() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();

			Registration activity = new Registration();
			String email = request.getParameter("email");
			String pass = request.getParameter("password");

			HttpSession session = request.getSession(true);
			session.setAttribute("loged", "false");

			if (activity.loginCOE(email, pass, request)) {
				session.setAttribute("loged", "true");
				session.setAttribute("logedID", email);

				session.setAttribute("utype", "COE");

				response.sendRedirect("/OEP/production/indexCOE.jsp");

			} else {
				out.print("<script>");
				out.print("alert('Invalid UserID/Password');");
				out.print("window.location.href='LoginCOE.jsp';");
				out.print("</script>");
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
