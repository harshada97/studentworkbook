package Login;

import java.sql.*;
import java.io.*;

public class login
{
	public static String loginValidation(String usr,String pwd)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		String memberid;
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM member WHERE username=? and password=? ");
		preparedStatement.setString(1, usr);
		preparedStatement.setString(2, pwd); 
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next())
		{
			//System.out.println("******************");
			if(resultSet.getBoolean(8))
	   		{
	   			//System.out.println("******************");
	   			return resultSet.getString(10);
	   		
	   		}
	   	}
	   	return "ERROR";
	   	
    }
	public static String rolecmp(String s)
	{
		String a="Student";
		String b="Admin";
		String c="Teacher";
		if(myEquals(a,s))
		{
			System.out.println("ROLE VALID");
			return "http://localhost:8080/Project/Student/index.jsp";
		}
		if(myEquals(b,s))
		{
			System.out.println("ROLE VALID");
			return "http://localhost:8080/Project/Admin/index.jsp";
		}
		if(myEquals(c,s))
		{
			System.out.println("ROLE VALID");
			return "http://localhost:8080/Project/Teacher/index.jsp";
		}
		else
			System.out.println("ROLE NOT VALID");
		return "http://localhost:8080/Project/index.html";
	}
	public static boolean myEquals(String s,String s1)
	{
		
		for(int i=0;i<s.length();)
		{
			if(s.charAt(i)==s1.charAt(i))
				i++;
			else
				return false;
		}
		return true;
	}
}
