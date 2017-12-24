import java.util.Hashtable;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

public class Player {

    private Hashtable<String, Double>           stats = new Hashtable<String, Double>();
    private String                              userName;
    private ArrayList<String>                   rooms = new ArrayList<String>();
    private String                              password;

    public Player(String userName, String password)
    {
        setUserName(userName);
        setPassword(password);
        stats.put("gamesPlayed", 0.0);
        stats.put("moves", 0.0);
        stats.put("wins", 0.0);
    }

    public Hashtable<String, Double> getStats() {
        return stats;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public Boolean signUp() {

        String                  userName = getUserName();
        String                  password = getPassword();
        String                  url = "jdbc:mysql://collaborativesudoku.cadzh3ufcslw.us-east-2.rds.amazonaws.com:3306/collaborativeSudoku";
        String                  rootName = "root";
        String                  rootPassword = "codysamdtan";

        try (Connection connection = DriverManager.getConnection(url, rootName, rootPassword)) {
            Statement stmt1 = connection.createStatement();
            Statement stmt2 = connection.createStatement();
            ResultSet rs;
            rs = stmt1.executeQuery("SELECT userName FROM users where userName = '"+userName+"'");
            if(rs.next() == false) { ;
                stmt2.executeUpdate("INSERT INTO users values('"+userName+"', '"+password+"')");
                connection.close();
                return true;
            }
            else {
                connection.close();
                return false;
            }
        } catch (SQLException e) {
            throw new IllegalStateException("Cannot connect the database!", e);
        }
    }

    public Boolean login() {
        String                  inputName = getUserName();
        String                  inputPassword = getPassword();
        String                  url = "jdbc:mysql://collaborativesudoku.cadzh3ufcslw.us-east-2.rds.amazonaws.com:3306/collaborativeSudoku";
        String                  rootName = "root";
        String                  rootPassword = "codysamdtan";

        try (Connection connection = DriverManager.getConnection(url, rootName, rootPassword)) {
            Statement stmt = connection.createStatement();
            ResultSet rs;
            rs = stmt.executeQuery("SELECT userName, password FROM users where userName = '"+inputName+"' AND password = '"+inputPassword+"'");
            if(rs.next() == false) {
                System.out.print("Username or password incorrect.\n");
                connection.close();
                return false;
            }
            connection.close();
        } catch (SQLException e) {
            throw new IllegalStateException("Cannot connect the database!", e);
        }
        return true;
    }

    public void getNewStats() {
        Database d = Database.getInstance();
        this.stats = d.getPlayerStats(this.userName);
    }


}
