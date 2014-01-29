package sqlConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.EmptyStackException;
import java.util.LinkedList;

import org.apache.commons.lang.StringEscapeUtils;
import org.postgresql.Driver;

import userInterface.FileIO;

public class ConnectionManager {

	private LinkedList<Connection> listeConnections ;
	private String ConfSQL;
	
	private int addConnection(Connection conn) {
		listeConnections.add(conn);
		return listeConnections.indexOf(conn);
	}
	
	public int newConnection() throws SQLException{
		//String[] authentification = FileIO.getLogins(AuthSQL);

		//String[] authentification = FileIO.getCredential(ConfSQL);
		
		String[] authentification = new String[] {"wander.cs.drexel.edu","*","rhh32_cs461","rhh32","TJtRb32UMWc804Y"};
		
		Connection conn = DriverManager.getConnection(
				"jdbc:postgresql://"+ authentification[0] +"/"+authentification[2],
				authentification[3], 
				authentification[4]
				);
		
		// Demarrage de la transaction (implicite dans notre cas)
		//conn.setAutoCommit(false);
		conn.setAutoCommit(true);
		//conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
		
		// Ajout de la connection au gestionnaire de connexion
		return addConnection(conn);
	}
	
	public int getIndiceLastConnectionCreated() throws Exception {
		int temp = getConnectionsCount();
		if (temp > 0) {
			return getConnectionsCount() -1 ;
		} else {
			throw new EmptyStackException();
		}
	}
	
	public int getConnectionsCount(){
		return listeConnections.size();
	}
	
	
	
	
	// Constructeur par d��faut
	public ConnectionManager(String ConfSQL){
		if (listeConnections == null)
			listeConnections = new LinkedList<Connection>() ;
		
		this.ConfSQL = ConfSQL ;
	
		try {
			DriverManager.registerDriver(new Driver());
		} catch (SQLException e) {
			System.out.println("FAIL !");
		}
		
	}
	
	
	
	
	
	public Connection getFirst(){
		return listeConnections.getFirst();
	}
	
	public Connection getLast(){
		return listeConnections.getLast();
	}
	
	public Connection get(int i){
		return listeConnections.get(i);
	}
	
	public void close(int i) throws SQLException{
		listeConnections.get(i).close();
	}
	
	public void closeAll() throws SQLException{
		for (Connection c : listeConnections){
			//c.commit();
			c.close();
		}
	}
	
	public String request(int i,String STMT) throws SQLException{
		// Creation de la requete
		Statement stmt = get(i).createStatement();
		String toReturn = "";
		// Execution de la requete
		if (STMT.contains("update") || STMT.contains("delete") || STMT.contains("alter") || STMT.contains("insert into") ){
			stmt.execute(STMT);
			//stmt.executeUpdate(org.apache.commons.lang.StringEscapeUtils.escapeSql(STMT));
		} else {
			ResultSet rset = stmt.executeQuery(STMT);
			toReturn = toReturn + getResultSet(rset);
			rset.close();
		}
		// Fermeture
		
		stmt.close();
		return toReturn ;
	}
	
	public String multiplerequest(int i, String STMT) throws SQLException{
		// Creation de la requete
		Statement stmt = get(i).createStatement();
		String[] parsingRequetes = STMT.split(";");
		String toReturn = "";
		// Execution de la requete
		for (int j = 0; j<parsingRequetes.length ; j++){
			ResultSet rset = null;
			parsingRequetes[j] = StringEscapeUtils.escapeSql(parsingRequetes[j]);
			
			try {
				if (	parsingRequetes[j].contains("update") ||
						parsingRequetes[j].contains("delete") || 
						parsingRequetes[j].contains("alter")  || 
						STMT.contains("insert into") ){
										
					System.out.println("executeQuery("+parsingRequetes[j] + ") va commencer");	
					stmt.executeQuery(parsingRequetes[j]);
				} else {
					
					System.out.println("executeQuery("+parsingRequetes[j] + ") va commencer");									
					rset = stmt.executeQuery(parsingRequetes[j]);
					toReturn = toReturn + "\n" + getResultSet(rset);
				}
					
			} catch (SQLException e) {
				if (e.getMessage().contains("ORA-00955")){
					System.out.print("Le nom de table existe d��j�� dans la base (" + parsingRequetes[j] +"), on continue qd meme");
				} else if (!e.getMessage().contains("ORA-01003")){				
					System.out.print("Erreur avec la requete  : " + parsingRequetes[j]);
					throw e;
				}
			}
			if (rset != null) rset.close();
		}
		
		// Fermeture
		stmt.close();
		
		return toReturn ;
	}
	
	private String getResultSet(ResultSet rset) throws SQLException{
			String result = "";
			ResultSetMetaData rsetmd = rset.getMetaData();
			int i = rsetmd.getColumnCount();
			for (int k=1;k<=i;k++)
				result = result + rsetmd.getColumnName(k) + "\t";
			
			result = result + "\n";
			
			while (rset.next()) {
				for (int j = 1; j <= i; j++) {
				result = result + rset.getString(j) + "\t";
				}
			result = result + "\n" ;
			}
			return result ;
	}
	

}
