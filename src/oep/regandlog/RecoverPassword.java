package oep.regandlog;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RecoverPassword
 */
@WebServlet("/RecoverPassword")
public class RecoverPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecoverPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			String mailID=(String) request.getParameter("email");
			String utype=(String) request.getParameter("Utype");
			Random generator=new Random();
			int newPass=100000+generator.nextInt(900000);
			Registration recover=new Registration();
			String redirect=new String();
			
			if (utype.equals("COE")) {
				redirect="/OEP/LoginCOE.jsp";
			} else if (utype.equals("Student")) {
				redirect = "/OEP/LoginStudent.jsp";
			} else {
				if (utype.equals("Teacher")) {
					redirect = "/OEP/Login.jsp";
				}
			}
			
			if(recover.recoverPassword(mailID, utype,newPass))
			{
				out.print("<script>");
				out.print("alert('Password changed,Check mail for new password');");
				out.print("window.location.href='"+redirect+"';");
				out.print("</script>");
				
			}
			else
			{
				out.print("<script>");
				out.print("alert('Something Went Wrong!!. Try Again');");
				out.print("window.location.href='../OEP/production/recoverPassword.jsp';");
				out.print("</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
}
