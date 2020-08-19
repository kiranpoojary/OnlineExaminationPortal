package oep.charts;

import oep.regandlog.BarChartExample;


import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.SwingUtilities;
import javax.swing.WindowConstants;


/**
 * Servlet implementation class TestBarChart
 */
@WebServlet("/TestBarChart")
public class TestBarChart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestBarChart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		try {
			String testID= request.getParameter("testID");
			
			SwingUtilities.invokeAndWait(()->{
				try
				{
					BarChartExample example=new BarChartExample("Chart: "+testID,testID);
				      example.setSize(800, 400);
				      example.setLocationRelativeTo(null);
				      example.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
				      example.setVisible(true);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			      
			    });
			
			
			
			if(session.getAttribute("utype").equals("Teacher"))
			{
				response.sendRedirect("../OEP/production/resultSelectTest.jsp");
			}
			else
				if(session.getAttribute("utype").equals("Student"))
				{
					response.sendRedirect("../OEP/production/studentAllResult.jsp");
				}
				else
					if(session.getAttribute("utype").equals("COE"))
					{
						response.sendRedirect("../OEP/production/allTestResult.jsp");
					}
			
			 
		} catch (InvocationTargetException | InterruptedException e) {
			
			e.printStackTrace();			
		}
		catch (Exception e) {
			
		}
		
	}
}
