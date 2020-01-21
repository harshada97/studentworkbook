package onLoad;

import java.sql.*;
import java.io.*;

public class showAssg
{
	String aname,ques,id,info,remark;
	Date adate,ddate;
	public showAssg()
	{
	
	}
	public showAssg(String assgName,String mid)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		String assgId;
		String s=null;
		int i=0;
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement("select * from assignmentmaster where assignmentname=?");
		preparedStatement.setString(1, assgName); 
		ResultSet resultSet = preparedStatement.executeQuery();
		while(resultSet.next())
	    {
	    				
	        			System.out.println("rec found!!!!");
    					id=resultSet.getString(1);
    					aname=resultSet.getString(2);
    					ques=resultSet.getString(4);
    					info=resultSet.getString(5);
    					System.out.println("Id :"+id);
    					preparedStatement = connection.prepareStatement("select * from assignmentbatch,studentassignment where assignmentbatch.assignmentid= studentassignment.assignmentid and studentassignment.assignmentid=? and memberid=?");
    					preparedStatement.setString(1, id);
    					preparedStatement.setString(2, mid);
    					ResultSet resultSet1 = preparedStatement.executeQuery();
    					if(resultSet1.next())
    					{
    						adate=resultSet1.getDate(3);
    						ddate=resultSet1.getDate(4);
    						remark=resultSet1.getString(7);
    					}
    					System.out.println("adate :"+adate);	
    					preparedStatement = connection.prepareStatement("select remark from remarksmaster where remarkid=?");
    					
    					preparedStatement.setString(1, remark);
    					resultSet1 = preparedStatement.executeQuery();
    					if(resultSet1.next())
    					{
    						
								remark=resultSet1.getString(1);
						}
		}
		
	}
	public String getan()
	{
		return aname;
	}
	public String ques()
	{
		return ques;
	}
	public Date adate()
	{
		return adate;
	}
	public Date ddate()
	{
		return ddate;
	}
	public String info()
	{
		return info;
	}
	public String remark()
	{
		return remark;
	}
	
	
		
}
