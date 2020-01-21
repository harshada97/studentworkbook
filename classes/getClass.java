package onLoad;

import java.sql.*;
import java.io.*;

public class getClass
{
	public static String[] getClassList(String mid)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		String s[]=new String[20];
		int i=0;
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement(" select distinct classname from classmaster,batchmaster where classmaster.classid=batchmaster.classid and batchid IN (select batchmaster.batchid from teacher,batchmaster,teacherbatch where teacher.memberid=teacherbatch.memberid and batchmaster.batchid=teacherbatch.batchid and teacherbatch.memberid=?) order by classname");
		preparedStatement.setString(1, mid); 
		ResultSet resultSet = preparedStatement.executeQuery();
		while(resultSet.next())
	    {
    					s[i++]=resultSet.getString(1);
    					

		}
		return s;
	}	
}
