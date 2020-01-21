package Admin;
import java.sql.*;
import java.util.*;
import java.time.LocalDate;

public class cm
{
	
	public static boolean createMember(String mid,String un,String pwd,String rollNo,String name,LocalDate bdate, String phoneNo,String bid, String cid,String role)throws Exception
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
			case 'S':	cm.student(mid,rollNo,name,bdate,phoneNo,bid,cid);
						break;
			case 'T':	cm.teacher(mid,rollNo,name,bdate,phoneNo);
						break;
		}
		if(prepareStatement.executeUpdate()!=-1)
			return true;
		else
			return false;
	}
	
	public static boolean student(String mid,String rollNo,String name,LocalDate bdate,String phoneNo,String bid,String cid)throws Exception
	{
		try
		{
			Class.forName("org.postgresql.Driver");
			Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
			PreparedStatement prepareStatement=connection.prepareStatement("Insert into student values(?,?,?,?,?,?,?)");
			prepareStatement.setString(1,mid);
			prepareStatement.setString(2,rollNo);
			prepareStatement.setString(3,name);
			prepareStatement.setDate(4, java.sql.Date.valueOf(java.time.LocalDate.now()));
			prepareStatement.setString(5, phoneNo);
			prepareStatement.setString(6,bid);
			prepareStatement.setString(7, cid);
			if(prepareStatement.executeUpdate()==-1)
				return false;
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
		
	}
	
	public static boolean teacher(String mid,String rollNo,String name,LocalDate bdate,String phoneNo)throws Exception
	{
		try
		{
			Class.forName("org.postgresql.Driver");
			Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
			PreparedStatement prepareStatement=connection.prepareStatement("Insert into teacher values(?,?,?,?,?)");
			prepareStatement.setString(1,mid);
			prepareStatement.setString(2,rollNo);
			prepareStatement.setString(3,name);
			prepareStatement.setDate(4, java.sql.Date.valueOf(java.time.LocalDate.now()));
			prepareStatement.setString(5, phoneNo);
			if(prepareStatement.executeUpdate()==-1)
				return false;
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
		
	}
	
	
}
		
		
		
		
		

