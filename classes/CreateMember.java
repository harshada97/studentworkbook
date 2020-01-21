package Admin;
import java.sql.*;
import java.util.*;

public class CreateMember
{
	
	public static boolean createMember(String mid,String un,String pwd,String rollNo,String name,String phoneNo,String bid, String cid,String role)throws Exception
	{ 
		Class.forName("org.postgresql.Driver");
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement prepareStatement=connection.prepareStatement("Insert into member values(?,?,?,?,?,?,?,?,?,?)");
		prepareStatement.setString(1,mid);
		prepareStatement.setString(2,un);
		prepareStatement.setString(3,pwd);
		prepareStatement.setDate(4, java.sql.Date.valueOf(java.time.LocalDate.now()));
		prepareStatement.setDate(5, java.sql.Date.valueOf(java.time.LocalDate.now()));	
		prepareStatement.setBoolean(6,false);
		prepareStatement.setDate(7, java.sql.Date.valueOf(java.time.LocalDate.now()));
		prepareStatement.setBoolean(8,true);
		prepareStatement.setLong(9,(long)Math.random()*1000000000);
		prepareStatement.setString(10,role);
		switch(role.charAt(0))
		{
			case 'S':	CreateMember.student(mid,rollNo,name,phoneNo,bid,cid);
						break;
			case 'T':	CreateMember.teacher(rollNo,name,phoneNo);
						break;
		}
		if(prepareStatement.executeUpdate()!=-1)
			return true;
		else
			return false;
	}
	
	public static boolean student(String mid,String rollNo,String name,String phoneNo,String bid,String cid) throws Exception
	{
		Class.forName("org.postgresql.Driver");
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement prepareStatement=connection.prepareStatement("Insert into student values(?,?,?,?,?,?,?)");
		prepareStatement.setString(1,mid);
		prepareStatement.setString(2,rollNo);
		prepareStatement.setString(3,name);
		prepareStatement.setString(4, phoneNo);
			prepareStatement.setString(5, cid);
		prepareStatement.setString(6,bid);
	
		if(prepareStatement.executeUpdate()==-1)
			return false;
		return true;
		
	}
	
	public static boolean teacher(String mid,String name,String phoneNo) throws Exception
	{
		Class.forName("org.postgresql.Driver");
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement prepareStatement=connection.prepareStatement("Insert into teacher values(?,?,?,?,?)");
		prepareStatement.setString(1,mid);
		prepareStatement.setString(2,name);
		prepareStatement.setString(3, phoneNo);
		if(prepareStatement.executeUpdate()==-1)
			return false;
		return true;
		
	}
	
	
}
		
		
		
		
		

