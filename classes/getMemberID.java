package Login;

import java.sql.*;
import java.io.*;

public class getMemberID
{
	public static String getMemberId(String usr)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		String memberid;
		String s=null;
		int i=0;
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement("select memberid from member where username=?");
		preparedStatement.setString(1, usr); 
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next())
	    {
	        			//.out.println("rec found!!!!");
    					return resultSet.getString(1);
    					//System.out.println(s);

		} 
		else
	    {
    					//System.out.println("ERROR");
						return "ERROR";

		}
	}
		
}
