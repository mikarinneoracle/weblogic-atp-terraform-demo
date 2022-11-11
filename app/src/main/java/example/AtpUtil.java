package example;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AtpUtil {
	private static DataSource dataSource;
	private static final String  JNDI_LOOKUP_SERVICE = "jdbc/atp";
	static{
		try {
			Context context = new InitialContext();
			Object lookup = context.lookup(JNDI_LOOKUP_SERVICE);
			dataSource = (DataSource)lookup;
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static DataSource getDataSource(){
		return dataSource;
	}
}

