package javaBeans;

import java.sql.*;
import java.util.*;

public final class ConnectionPool {
    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }

    private ArrayList<Connection> free;
    private ArrayList<Connection> used;
    private String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private String user = "c##survey";
    private String password = "1234";
    private int initCons = 10;
    private int maxCons = 20;
    private int numCons = 0;
    private static ConnectionPool cp;
    // ConnectionPool 객체 리턴
    public static ConnectionPool getInstance() {
        try {
            if (cp == null) {
                synchronized (ConnectionPool.class) {
                    cp = new ConnectionPool();
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        return cp;
    }

    private ConnectionPool() throws SQLException {

        free = new ArrayList<Connection>(initCons);
        used = new ArrayList<Connection>(initCons);

        while (numCons < initCons) {

            addConnection();
        }
    }

    private void addConnection() throws SQLException {
        free.add(getNewConnection());
    }

    private Connection getNewConnection() throws SQLException {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("About to connect to " + conn);
        numCons++;
        return conn;
    }

    public synchronized Connection getConnection() throws SQLException {

        if (free.isEmpty()) {

            while (numCons < maxCons) {
                addConnection();
            }
        }
        Connection _conn = free.get(free.size() - 1);
        free.remove(_conn);
        used.add(_conn);
        return _conn;
    }

    public synchronized void releaseConnection(Connection _conn) throws SQLException {
        boolean flag = false;
        if (used.contains(_conn)) {
            used.remove(_conn);
            numCons--;
            flag = true;
        } else {
            throw new SQLException();
        }
        try {
            if (flag) {
                free.add(_conn);
                numCons++;
            } else {
                _conn.close();
            }

        } catch (SQLException e) {

            try {
                _conn.close();
            } catch (SQLException e2) {
                e2.printStackTrace();
            }
        }
    }

    public void closeAll() {
        for (int i = 0; i < used.size(); i++) {
            Connection _con = (Connection) used.get(i);
            used.remove(i--);
            try {
                _con.close();
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
        }

        for (int i = 0; i < free.size(); i++) {
            Connection _con = (Connection) free.get(i);
            free.remove(i--);
            try {
                _con.close();
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
        }
    }

    public int getNumCons() {

        return numCons;
    }
}
