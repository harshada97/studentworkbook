package onLoad;

import java.sql.*;
import java.io.*;

public class getSubjects
{
	public static String[] getSubjectList(String usr)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		String memberid;
		String s=null;
		int i=0;
		String subs[]=new String[20];
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement(" select classid from student where memberid=?");
		preparedStatement.setString(1, usr); 
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next())
	    {
	        			//System.out.println("rec found!!!!");
    					s=resultSet.getString(1);
    					//System.out.println(s);

		} 
		else
	    {
    					System.out.println("ERROR");

		}
		PreparedStatement preparedStatement1 = connection.prepareStatement("select subjectname from subjectmaster,classmaster,classsubject where classmaster.classid=classsubject.classid and subjectmaster.subjectid=classsubject.subjectid and classmaster.classid=?");
		preparedStatement1.setString(1,s);
		ResultSet resultSet1 = preparedStatement1.executeQuery();
		if (resultSet1!=null)
	      {
	      			while(resultSet1.next())
	      			{
	      				if(resultSet1.getString(1)==null);
	      					
	      				else
	      					subs[i++]=resultSet1.getString(1);
    				}

		} 
		else
		{
			subs[i]="ERROR";
		}
		return subs;	
		
		
	}
}
