package profile;

import java.sql.*;
public class admin
{
	 String memberID,username,password,name,role,iname;
	public admin(String memberID)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement(" select admin.memberID,username,password,role,aname,institute from admin,member where admin.memberID=member.memberID and member.memberid=?");
		preparedStatement.setString(1, memberID); 
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next())
	        {
    					this.memberID=resultSet.getString(1);
    					username=resultSet.getString(2);
    					password=resultSet.getString(3);
    					role=resultSet.getString(4);
    					name=resultSet.getString(5);
    					iname=resultSet.getString(6);
    					
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
    	public String getIname()
    	{
    		return iname;
    	}
    	
    	
}
    	
