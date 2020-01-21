package profile;

import java.sql.*;
public class Student
{
	 String memberID,username,password,name,studentClass,batch,role;
	 int rollNo;
	public Student(String memberID)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement(" select student.memberID,username,password,role,studentname,rollno from student,member where student.memberID=member.memberID and member.memberid=?");
		preparedStatement.setString(1, memberID); 
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next())
	        {
    					this.memberID=resultSet.getString(1);
    					username=resultSet.getString(2);
    					password=resultSet.getString(3);
    					role=resultSet.getString(4);
    					name=resultSet.getString(5);
    					rollNo=resultSet.getInt(6);
    					
    		} 
    		System.out.println("MID:"+memberID);
    		System.out.println("username:"+username);
    		System.out.println("name:"+name);
    		//return this;
    	}
    	public  String getName()
    	{
    		return name;
    	}
    	public  String getMemberID()
    	{
    		return memberID;
    	}
    	public  String getUserName()
    	{
    		return username;
    	}
    	public  String getPassword()
    	{
    		return password;
    	}
    	public  String getRole()
    	{
    		return role;
    	}
    	public int getRollNo()
    	{
    		return rollNo;
    	}
    	
    	
}
    	
