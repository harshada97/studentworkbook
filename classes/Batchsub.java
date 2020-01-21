package onLoad;

import java.sql.*;
import java.io.*;

public class Batchsub
{
	public static String[] getSubList(String mid,String bn,String cn)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		String s[]=new String[20];
		int i=0;
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement("select subjectname from subjectmaster where subjectid IN (select subjectid from teacherbatch where memberid=? and batchid=(select batchid from batchmaster where batchname=? and classid=(select classid from classmaster where classname=?)))");

		preparedStatement.setString(1, mid);   
		preparedStatement.setString(2, bn);
		preparedStatement.setString(3, cn);
		ResultSet resultSet = preparedStatement.executeQuery();
		while(resultSet.next())
	    {
    					s[i++]=resultSet.getString(1);
    					
    					

		}
		return s;
	}
}
