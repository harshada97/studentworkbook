package onLoad;




import java.sql.*;
import java.io.*;

public class isRemark
{
	
	public static String[] remark(int rn,String an)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		String s[]=new String[20];
		int i=0,rid;
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement("select remarkid from studentassignment where memberid=(select memberid from student where rollno=?) and assignmentid IN (select assignmentid from assignmentmaster where assignmentname=?)");


		preparedStatement.setInt(1,rn);   
		preparedStatement.setString(2, an);
		ResultSet resultSet = preparedStatement.executeQuery();
		if(resultSet.next())
	    {
    					rid=Integer.parseInt(resultSet.getString(1));
    					System.out.println(rid);
    					if(rid==-1)
    					{
    						 preparedStatement = connection.prepareStatement("select remark from remarksmaster where remarkid <> '-1'");
    						 resultSet = preparedStatement.executeQuery();
    						 while(resultSet.next())
    						 {
    						 	s[i++]=resultSet.getString(1);
    						 }
    					}
    					else
    					{
    						 preparedStatement = connection.prepareStatement("select remark from remarksmaster where remarkid=?");
    						 System.out.println(resultSet.getString(1));
    						 preparedStatement.setString(1, resultSet.getString(1)); 
    						 resultSet = preparedStatement.executeQuery();
    						 if(resultSet.next())
    						 {
    						 	 System.out.println(resultSet.getString(1));
    						 	s[i++]=resultSet.getString(1);
    						 }
    					}
    					
    					
    	}
		return s;
	}
	public static void main(String args[])throws Exception
	{
		String r[]=isRemark.remark(301,"Create Statement");
		System.out.println(r[2]);
	}
}
