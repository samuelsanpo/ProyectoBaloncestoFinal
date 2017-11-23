/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conneccion;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 
 */
public class ConnecionMYSQL {
    // -----------------------------------------------------------------
	// DECLARACIÓN DE VARIABLES
	// -----------------------------------------------------------------
	private String USER = "root";
        private String PASSWORD = "Ltp980928";
        private String HOST = "localHost";
        private String PORT = "3306";
        private String DATABASE = "balonbases";
        private String CLASSNAME = "com.mysql.jdbc.Driver";
        private String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE ;
        private Connection con;

	// -----------------------------------------------------------------
	// METODOS
	// -----------------------------------------------------------------

	// -----------------------------------------------------------------
	// Metodo setConneccion:
	// Procedimiento que establece conección con la base de datos.
	//
	// -----------------------------------------------------------------
	public Connection setConeccion() throws ClassNotFoundException,
			SQLException, InstantiationException, IllegalAccessException {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE, USER, PASSWORD);
		return con;
	}

	// -----------------------------------------------------------------
	// Metodo setCerrarConeccion:
	// Procedimiento que cierra la conección con la base de datos.
	//
	// -----------------------------------------------------------------
	public void setCerrarConeccion() throws SQLException {
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) { /* ignore close errors */
			}
		}
	}
}
