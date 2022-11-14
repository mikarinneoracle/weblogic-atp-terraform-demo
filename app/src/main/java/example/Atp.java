package example;

import javax.sql.*;
import java.sql.*;
import javax.naming.*;
public class Atp
{
    public static String error = "";

    public static TierPrice getTierPrice(String tier)
    {
        TierPrice tierPrice = new TierPrice();
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
                error = "No datasource available";
            }
        } catch (Exception e) {
            error = e.getMessage();
        }
        return tierPrice;
    }
}
