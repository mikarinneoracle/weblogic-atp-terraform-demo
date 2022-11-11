package example;

import javax.sql.*;
import java.sql.*;
import javax.naming.*;
import java.util.Hashtable;
public class Atp
{
    public static String test()

    public static String runsql()
    {
        String sql = "select sysdate from dual";
        String res = "";
        try {
            if(AtpUtil.getDataSource() != null)
            {
                Connection connection = AtpUtil.getDataSource().getConnection();
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
                    res = resultSet.getString("sysdate");
                }
                connection.close();
            } else {
                res = "Datasource not available";
            }
        } catch (Exception e) {
            res = e.getMessage();
        }
        return res;
    }
}
