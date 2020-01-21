package onLoad;

import java.sql.*;
import java.io.*;

public class getBatch
{
	public static String[] getBatchList(String classname,String mid)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		String s[]=new String[20];
		int i=0;
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement(" select batchname from batchmaster,classmaster where batchmaster.classid=classmaster.classid and classmaster.classid=(select classid from classmaster where classname=?) and batchid IN (select batchmaster.batchid from batchmaster,teacher,teacherbatch where teacher.memberid=teacherbatch.memberid and batchmaster.batchid=teacherbatch.batchid and teacherbatch.memberid=?)");

		preparedStatement.setString(1, classname);
		preparedStatement.setString(2, mid);  
		ResultSet resultSet = preparedStatement.executeQuery();
		while(resultSet.next())
	    {
    					s[i++]=resultSet.getString(1);
    					

		}
		return s;
	}
		
}
