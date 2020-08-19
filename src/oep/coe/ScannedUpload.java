package oep.coe;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class ScannedUpload
 */
@WebServlet("/ScannedUpload")
@MultipartConfig(maxFileSize = 16177216) // 1.5MB
public class ScannedUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     *
    public ScannedUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			String testID=request.getParameter("uploadClicked");
			String stdReg=request.getParameter("stdReg:"+testID);
			PrintWriter out=response.getWriter();

			
			Part scanFile = request.getPart("file:"+testID);
			InputStream streamScan = null;
			if (scanFile != null) {
				streamScan = scanFile.getInputStream();
			}
			
			CoeAddOperation scanUpload=new CoeAddOperation();
			if(scanUpload.scanUpload(stdReg, testID, streamScan))
			{
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Upload Successful');");
				out.println("location='../OEP/production/uploadScannedPaper.jsp';");
				out.println("</script>");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Upload Failed');");
				out.println("location='../OEP/production/uploadScannedPaper.jsp';");
				out.println("</script>");
			}
			//out.print("<iframe  height='60%' width='60%'></iframe>");
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
