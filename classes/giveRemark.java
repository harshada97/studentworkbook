package onLoad;

import java.sql.*;
import java.io.*;

public class giveRemark
{
	public static boolean given(int rn,String an,String r)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement("Update studentassignment set remarkid=(select remarkid from remarksmaster where remark=?) where memberid IN (select memberid from student where rollno=?) and assignmentid IN (select assignmentid from assignmentmaster where assignmentname=?)");

		preparedStatement.setString(1,r);   
		preparedStatement.setInt(2, rn);
		preparedStatement.setString(3,an);
		if(preparedStatement.executeUpdate()!=-1)
	    {
    				return true;
    					

		}
		return false;
	}
		
}

