package Admin;
import java.sql.*;

public class Disable
{
	
	public static boolean disableMember(String mid)throws Exception
	{ 
		Class.forName("org.postgresql.Driver");
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement prepareStatement=connection.prepareStatement("select isactive from member where memberid=?");
		prepareStatement.setString(1,mid);
		ResultSet resultSet=prepareStatement.executeQuery();
		if(resultSet.next())
		{
			if(!resultSet.getBoolean(1))
			{
				System.out.println("11Yikes");
				return false;
			}
		}
		prepareStatement=connection.prepareStatement("Update member set isactive=false where memberid=?");
		prepareStatement.setString(1,mid);
		if(prepareStatement.executeUpdate()!=-1)
		{
			System.out.println("Executeed");
			return true;
		}
		else
		{
			
			System.out.println("Yikes");
			return false;
		}
	}
	public static void main(String args[])throws Exception
	{
		disableMember("310");
	}
}
		
		
		
		
		

