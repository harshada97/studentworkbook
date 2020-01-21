package onLoad;


import java.sql.*;
import java.io.*;

public class giveAssg
{
	public static boolean given(String bn,String cn,String tn,String an)throws Exception
	{
		String mid,aid;
		int f=0;
		Class.forName("org.postgresql.Driver");
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement("select memberid from student where batchid= (select batchid from batchmaster where batchname=? and classid=(select classid from classmaster where classname=?))");

		preparedStatement.setString(1,bn);   
		preparedStatement.setString(2, cn);
		ResultSet resultset=preparedStatement.executeQuery();
		
		PreparedStatement preparedStatement1 = connection.prepareStatement("select assignmentid from assignmentmaster where topicid=(select topicid from topicmaster where topicname=?) and assignmentname=?");
		preparedStatement1.setString(1,tn);   
		preparedStatement1.setString(2, an);
		ResultSet resultset1=preparedStatement1.executeQuery();
		if(resultset1.next())
		{
		aid=resultset1.getString(1);
		}
		else
		{
			return false;
		}
		
		while(resultset.next())
	    {
	    	mid=resultset.getString(1);
	    	preparedStatement1 = connection.prepareStatement("insert into studentAssignment values(?,?,'-1')");
	    	preparedStatement1.setString(1,mid);   
			preparedStatement1.setString(2, aid);
			if(preparedStatement1.executeUpdate()!=-1)
				f=1;
				
		}
	    if(f==1)
	    	return true;
		return false;
	}
		


	
	public static void main(String[] args)throws Exception
	{
		giveAssg.given("ty2","sy1","JDBC","Sample Programs");
	}
		
}

