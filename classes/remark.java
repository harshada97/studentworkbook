package Admin;

import java.sql.*;

public class remark
{
	 public static String remark(String rid,String r,String m)throws Exception
	 {
	 	Class.forName("org.postgresql.Driver");
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement prepareStatement=connection.prepareStatement("insert into remarksmaster values(?,?,?)");
		prepareStatement.setString(1,rid);
		prepareStatement.setString(2,r);
		prepareStatement.setInt(3,Integer.parseInt(m));
		if(prepareStatement.executeUpdate()==-1)
			return "Remark Created Succesfully!!!";
		else
			return "Remark not created";
	}
}
	 	
