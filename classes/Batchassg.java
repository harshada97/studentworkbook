package onLoad;

import java.sql.*;
import java.io.*;

public class Batchassg
{
	String aname,ad,dd;
	public static Batchassg[] getAssgList(String tn,String bn,String cn)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		Batchassg s[]=new Batchassg[20];
		int i=0;
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement("select assignmentname,assigneddate,duedate from assignmentmaster,assignmentbatch where assignmentmaster.assignmentid=assignmentbatch.assignmentid and  assignmentbatch.assignmentid IN(select assignmentbatch.assignmentid from assignmentmaster,assignmentbatch where assignmentmaster.assignmentid=assignmentbatch.assignmentid and topicid=(select topicid from topicmaster where topicname=?)) and batchid=(select batchid from batchmaster where batchname=? and classid=(select classid from classmaster where classname=?))");
;

		preparedStatement.setString(1, tn);   
		preparedStatement.setString(2, bn);
		preparedStatement.setString(3, cn); 
		ResultSet resultSet = preparedStatement.executeQuery();
		while(resultSet.next())
	    {
	    				s[i]=new Batchassg();
    					s[i].aname=resultSet.getString(1);
    					s[i].ad=resultSet.getString(2);
    					s[i].dd=resultSet.getString(3);
    					i++;
		}
		return s;
	}
	public String aName()
	{
		return aname;
	}
	public String ad()
	{
		return ad;
	}
	public String dd()
	{
		return dd;
	}
	
	
		
}
