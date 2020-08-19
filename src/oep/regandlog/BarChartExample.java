package oep.regandlog;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JFrame;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class BarChartExample extends JFrame {

	String subjectName=new String();
	String testID = new String();
	String testName = new String();
	int maxMark = 0;
	int maxBars=0;
	int steps=0;
	
	String dbUrl = "jdbc:mysql://localhost/oep_db";
	String driverName = "com.mysql.jdbc.Driver";
	

	private static final long serialVersionUID = 1L;

	public BarChartExample(String appTitle,String testCode) throws ClassNotFoundException, SQLException {
		super(appTitle);
		this.testID=testCode;
		Class.forName(driverName);
		Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
		
		PreparedStatement ps1 = (PreparedStatement) connection
				.prepareStatement("SELECT * FROM exams LEFT JOIN subjects ON exams.subjectID=subjects.subjectID WHERE examID=?");
		ps1.setString(1, testID);
		ResultSet rs1 = ps1.executeQuery();
		if (rs1.next()) {
			this.testName = rs1.getString(4);
			this.maxMark = rs1.getInt(8);
			this.subjectName=rs1.getString(11);
		}
		if(maxMark>50)
		{
			maxBars=maxMark/10;
			steps=5;
		}
		else
		{
			maxBars=maxMark/2;
			steps=2;
		}
			
		CategoryDataset dataset = createDataset();
		
		// Create chart
		JFreeChart chart = ChartFactory.createBarChart3D(subjectName+"("+testName+")", // Chart Title
				"Marks", // Category axis
				"Number Of Students", // Value axis
				dataset, PlotOrientation.VERTICAL, true, true, false);
		ChartPanel panel = new ChartPanel(chart);
		setContentPane(panel);
	}
	
	public void setTestID(String testCode) {
		testID = testCode;
		
	}

	private CategoryDataset createDataset() throws ClassNotFoundException, SQLException {
		int from=0;
		int to=steps;
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		Class.forName(driverName);
		Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
		
		while(maxBars>0)
		{

			PreparedStatement ps1 = (PreparedStatement) connection
					.prepareStatement("SELECT COUNT(total) as finalCount FROM \r\n" + 
							"( SELECT total FROM \r\n" + 
							"	(select studID as reg, sum(marks)as total from \r\n" + 
							"		(select studID, marks from answerdescriptive d WHERE examID=? \r\n" + 
							"			union all \r\n" + 
							"		 select studID, marks from answermcq a WHERE examID=? 			\r\n" + 
							"		)\r\n" + 
							"		answermcqanswerdescriptive GROUP BY reg\r\n" + 
							"	)as totala WHERE total BETWEEN ? AND ? \r\n" + 
							")as result\r\n" + 
							"");
			ps1.setString(1, testID);
			ps1.setString(2, testID);
			ps1.setInt(3, from);
			ps1.setInt(4, to);
			ResultSet rs1 = ps1.executeQuery();
			if (rs1.next()) {
				dataset.addValue(rs1.getInt(1), from+"-"+to, from+"-"+to);
			}
			
			from=to+1;
			to=to+steps;
			maxBars-=1;
		}
		
	
		return dataset;

	}

}
