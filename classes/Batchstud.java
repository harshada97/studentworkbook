package onLoad;

import java.sql.*;
import java.io.*;

public class Batchstud
{
	String name;
	int rollno;
	public static Batchstud[] getStudentList(String bn,String cn)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		Batchstud s[]=new Batchstud[20];
		int i=0;
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement("select studentname,rollno from student where batchid IN (select batchid from batchmaster where batchname=? and classid=(select classid from classmaster where classname=?))");
		preparedStatement.setString(1, bn);  
		preparedStatement.setString(2, cn); 
		ResultSet resultSet = preparedStatement.executeQuery();
		while(resultSet.next())
	    {
	    				s[i]=new Batchstud();
    					s[i].name=resultSet.getString(1);
    					s[i].rollno=resultSet.getInt(2);
    					i++;
    					

		}
		return s;
	}
	public String getName()
	{
		return name;
	}
	
	public int getrollno()
	{
		return rollno;
	}
		
}
