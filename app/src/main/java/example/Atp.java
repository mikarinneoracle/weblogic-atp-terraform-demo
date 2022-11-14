package example;

import javax.sql.*;
import java.sql.*;
import javax.naming.*;
public class Atp
{
    static String error = "";
    public static void setError(String error) { this.error = error; };
    public static String getErrror() { return error; };

    public static TierPrice getTierPrice(String tier)
    {
        tierPrice = new TierPrice();
        try {
            if(AtpUtil.getDataSource() != null)
            {
                Connection connection = AtpUtil.getDataSource().getConnection();
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("select PRICE_MO, USERS, STORAGE, SUPPORT from PRICE where TIER = '" + tier + "'");
                while (resultSet.next()) {
                    tierPrice.setTierPrice(resultSet.getFloat("PRICE_MO"), 
                                           resultSet.getInt("USERS"),
                                           resultSet.getInt("STORAGE"),
                                           resultSet.getString("SUPPORT")
                                          );
                }
                connection.close();
            } else {
                this.setError("No datasource available");
            }
        } catch (Exception e) {
            this.setError(e.getMessage());
        }
        return tierPrice;
    }
}
