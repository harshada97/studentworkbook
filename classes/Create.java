package Admin;

import java.sql.*;
public class Create
{
	
	public static boolean divison(String did,String dn)throws Exception
	{ 
		try
		{	
			Class.forName("org.postgresql.Driver");
			Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
			PreparedStatement prepareStatement=connection.prepareStatement("Insert into divisionmaster values(?,?)");
			prepareStatement.setString(1,did);
			prepareStatement.setString(2,dn);
			if(prepareStatement.executeUpdate()==-1)
				return false;
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	
	public static boolean Class(String did,String dn)throws Exception
	{ 
		try
		{	
			Class.forName("org.postgresql.Driver");
			Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
			PreparedStatement prepareStatement=connection.prepareStatement("Insert into classmaster values(?,?)");
			prepareStatement.setString(1,did);
			prepareStatement.setString(2,dn);
			if(prepareStatement.executeUpdate()==-1)
				return false;
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	
	public static boolean addStud(String did,String dn)throws Exception
	{ 
		try
		{	
			Class.forName("org.postgresql.Driver");
			Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
			PreparedStatement prepareStatement=connection.prepareStatement("Update student set batchid=? where memberid=?");
			prepareStatement.setString(1,dn);
			prepareStatement.setString(2,did);
			if(prepareStatement.executeUpdate()==-1)
				return false;
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	public static boolean subject(String did,String dn)throws Exception
	{ 
		try
		{	
			Class.forName("org.postgresql.Driver");
			Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
			PreparedStatement prepareStatement=connection.prepareStatement("insert into subjectmaster  values(?,?)");
			prepareStatement.setString(1,dn);
			prepareStatement.setString(2,did);
			if(prepareStatement.executeUpdate()==-1)
				return false;
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	public static boolean linkClassSubject(String did,String dn)throws Exception
	{ 
		try
		{	
			Class.forName("org.postgresql.Driver");
			Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
			PreparedStatement prepareStatement=connection.prepareStatement("select classid from classmaster where classid=?");
			prepareStatement.setString(1,did);
			ResultSet resultSet= prepareStatement.executeQuery();
			if(!resultSet.next())
				return false;
			else
			{
				System.out.println(dn);
				prepareStatement=connection.prepareStatement("select subjectid from subjectmaster where subjectid=?");
				prepareStatement.setString(1,dn);
				resultSet= prepareStatement.executeQuery();
				if(!resultSet.next())
				{
					System.out.println("i failes "+dn);
					return false;
				}
				else
				{
					prepareStatement=connection.prepareStatement("insert into classsubject values(?,?)");
					prepareStatement.setString(1,did);
					prepareStatement.setString(2,dn);
					if(prepareStatement.executeUpdate()==-1)
					{
						System.out.println("i failes also"+dn);
						return false;
					}
				}
			}
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	public static boolean topic(String did,String dn,String sid)throws Exception
	{ 
		try
		{	
			Class.forName("org.postgresql.Driver");
			Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
			PreparedStatement prepareStatement=connection.prepareStatement("select subjectid from subjectmaster where subjectid=?");
			prepareStatement.setString(1,sid);
			ResultSet rs=prepareStatement.executeQuery();
			if(!rs.next())
				return false;
			else
			{
				prepareStatement=connection.prepareStatement("insert into topicmaster values(?,?,?)");
				prepareStatement.setString(1,did);
				prepareStatement.setString(2,dn);
				prepareStatement.setString(3,sid);
				if(prepareStatement.executeUpdate()==-1)
					return false;
			}
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	public static boolean assignment(String did,String dn,String tn,String q)throws Exception
	{ 
		try
		{	
			Class.forName("org.postgresql.Driver");
			Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
			PreparedStatement prepareStatement=connection.prepareStatement("select topicid from topicmaster where topicname=?");
			prepareStatement.setString(1,tn);
			ResultSet rs=prepareStatement.executeQuery();
			if(!rs.next())
			{
				System.out.println(tn);
				return false;
			}
			else
			{
				prepareStatement=connection.prepareStatement("insert into assignmentmaster values(?,?,?,?)");
				prepareStatement.setString(1,did);
				prepareStatement.setString(2,dn);
				prepareStatement.setString(3,rs.getString(1));
				prepareStatement.setString(4,q);
				if(prepareStatement.executeUpdate()==-1)
				{
					System.out.println("i failes also"+dn);
					return false;
				}
				return true;
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
			return false;
		}
	}
	public static boolean linkTB(String tid,String bid)
	{
			
			try
			{
				Class.forName("org.postgresql.Driver");
				Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
				PreparedStatement prepareStatement=connection.prepareStatement("select teacherid from teacher where teacherid=?");
				prepareStatement.setString(1,tid);
				ResultSet rs=prepareStatement.executeQuery();
				if(!rs.next())
				{
					System.out.println(tid);
					return false;
				}
				else
				{
					prepareStatement=connection.prepareStatement("select batchid from subjectmaster where batchid=?");
					prepareStatement.setString(1,bid);
					rs= prepareStatement.executeQuery();
					if(!rs.next())
					{
						System.out.println("i failes "+bid);
						return false;
					}
					else
					{
						prepareStatement=connection.prepareStatement("insert into teacherbatch values(?,?)");
						prepareStatement.setString(1,tid);
						prepareStatement.setString(2,bid);
						if(prepareStatement.executeUpdate()==-1)
						{
							System.out.println("i failes also"+tid);
								return false;
						}
						return true;
					}
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
				return false;
			}
		}	
}
