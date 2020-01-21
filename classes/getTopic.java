package onLoad;
import java.sql.*;

public class getTopic 
{
	public static String[] getTopicList(String s)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		int i=0;
		String topics[]=new String[10];
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement(" select topicname from topicmaster where subjectid=(select subjectid from subjectmaster where subjectname=?)");
		preparedStatement.setString(1,s); 
		ResultSet resultSet = preparedStatement.executeQuery();
		while(resultSet.next())
		{
			topics[i++]=resultSet.getString(1);
		}
		
		return topics;
	}
	public static String[] getAssgList(String t)throws Exception
	{
		Class.forName("org.postgresql.Driver");
		int i=0;
		String assg[]=new String[14];
		Connection connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres"," ");
		PreparedStatement preparedStatement = connection.prepareStatement("select assignmentname from assignmentmaster where topicid=(select topicid from topicmaster where topicname=?)");
		preparedStatement.setString(1,t); 
		ResultSet resultSet = preparedStatement.executeQuery();
		while(resultSet.next())
		{
			//System.out.println(resultSet.getString(1));
			//System.out.println(resultSet.getString(1));
			assg[i++]=resultSet.getString(1);
		}
		
		return assg;
	}
}
		
		
		
