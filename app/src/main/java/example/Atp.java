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
    
    public static TierOptions getTierOptions(String tier)
    {
        TierOptions tierOptions = new TierOptions();
        try {
            if(AtpUtil.getDataSource() != null)
            {
                Connection connection = AtpUtil.getDataSource().getConnection();
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("select ISPUBLIC, ISPRIVATE, ISPERMISSIONS, ISSHARING, ISUNLIMITED, ISEXTRASEC from OPTIONS where TIER = '" + tier + "'");
                while (resultSet.next()) {
                    tierOptions.setTierOptions(resultSet.getString("ISPUBLIC"), 
                                               resultSet.getString("ISPRIVATE"),
                                               resultSet.getString("ISPERMISSIONS"),
                                               resultSet.getString("ISSHARING"),
                                               resultSet.getString("ISUNLIMITED"),
                                               resultSet.getString("ISEXTRASEC")
                                          );
                }
                connection.close();
            } else {
                error = "No datasource available";
            }
        } catch (Exception e) {
            error = e.getMessage();
        }
        return tierOptions;
    }
    
    public static void saveTierPrice(String tier, TierPrice tierPrice)
    {
        try {
            if(AtpUtil.getDataSource() != null)
            {
                Connection connection = AtpUtil.getDataSource().getConnection();
                Statement statement = connection.createStatement();
                statement.executeUpdate("update PRICE set " +
                    "PRICE_MO='" + tierPrice.price_mo + "'," +
                    "USERS='" + tierPrice.users + "'," +
                    "STORAGE='" + tierPrice.storage + "'," +
                    "SUPPORT='" + tierPrice.support + "' " + 
                    "where TIER = '" + tier + "'");
                connection.close();
            } else {
                error = "No datasource available";
            }
        } catch (Exception e) {
            error = e.getMessage();
        }
    }
    
    public static void saveTierOptions(String tier, TierOptions tierOptions)
    {
        try {
            if(AtpUtil.getDataSource() != null)
            {
                Connection connection = AtpUtil.getDataSource().getConnection();
                Statement statement = connection.createStatement();
                statement.executeUpdate("update OPTIONS set " +
                    "ISPUBLIC='" + tierOptions.isPublic + "'," +
                    "ISPRIVATE='" + tierOptions.isPrivate + "'," +
                    "ISPERMISSIONS='" + tierOptions.isPermissions + "'," +
                    "ISSHARING='" + tierOptions.isSharing + "', " + 
                    "ISUNLIMITED='" + tierOptions.isUnlimited + "', " + 
                    "ISEXTRASEC='" + tierOptions.isExtrasec + "' " +
                    "where TIER = '" + tier + "'");
                connection.close();
            } else {
                error = "No datasource available";
            }
        } catch (Exception e) {
            error = e.getMessage();
        }
    }
}
