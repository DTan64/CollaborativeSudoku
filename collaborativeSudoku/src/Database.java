import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.concurrent.ThreadLocalRandom;

public class Database {

    public static String url = "jdbc:mysql://collaborativesudoku.cadzh3ufcslw.us-east-2.rds.amazonaws.com:3306/collaborativeSudoku";
    public static String rootName = "root";
    public static String rootPassword = "codysamdtan";

    private Database() {
        setUrl(this.url);
        setRootName(this.rootName);
        setRootPassword(this.rootPassword);
    }

    private static final Database dbInstance = new Database();

    public static Database getInstance() {
        return dbInstance;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setRootName(String rootName) {
        this.rootName = rootName;
    }

    public void setRootPassword(String rootPassword) {
        this.rootPassword = rootPassword;
    }

    public String getBoard(Integer id) {

        try(Connection connection = DriverManager.getConnection(url, rootName, rootPassword)) {
            Statement stmt = connection.createStatement();
            ResultSet rs;
            rs = stmt.executeQuery("SELECT  id, startBoard from boards where id = '"+id+"'");
            if(rs.next() == false)
                System.out.print("Could not retrieve board\n");
            else
            {
                String board = rs.getString("startBoard");
                connection.close();
                return board;
            }
        }
        catch (SQLException e) {
            throw new IllegalStateException("Cannot connect the database!\n", e);
        }
        return "";
    }

    public String getSolution(Integer id) {

        try(Connection connection = DriverManager.getConnection(url, rootName, rootPassword)) {
            Statement stmt = connection.createStatement();
            ResultSet rs;
            rs = stmt.executeQuery("SELECT  id, finishBoard from boards where id = '"+id+"'");
            if(rs.next() == false)
                System.out.print("Could not retrieve board\n");
            else
            {
                String board = rs.getString("finishBoard");
                connection.close();
                return board;
            }
        }
        catch (SQLException e) {
            throw new IllegalStateException("Cannot connect the database!\n", e);
        }
        return "";
    }

    public Hashtable<String, Double> getPlayerStats(String playerName) {

        Hashtable<String, Double> ans = new Hashtable<>();
        try(Connection connection = DriverManager.getConnection(url, rootName, rootPassword)) {
            Statement stmt = connection.createStatement();
            ResultSet rs;
            rs = stmt.executeQuery("SELECT gamesPlayed, moves, wins from stats where userName = '"+playerName+"'");
            if(rs.next())
            {
                rs.beforeFirst();
                rs.next();
                double gp = rs.getDouble("gamesPlayed");
                double moves = rs.getDouble("moves");
                double wins = rs.getDouble("wins");
                ans.put("gamesPlayed", gp);
                ans.put("moves", moves);
                ans.put("wins", wins);
                connection.close();
            }
            else
            {
                System.out.println("empty query result\n");
            }
        }
        catch (SQLException e) {
            throw new IllegalStateException("Cannot connect the database!\n", e);
        }
        return ans;
    }

    public void updateBoard(String roomName, String newBoard) {

        try(Connection connection = DriverManager.getConnection(url, rootName, rootPassword)) {
            Statement stmt = connection.createStatement();
            int rs;
            rs = stmt.executeUpdate("UPDATE rooms set currentBoard = '"+newBoard+"' where roomName = '"+roomName+"'");
            if(rs == 0)
            {
                connection.close();
            }
            else
            {
                connection.close();
            }

        }
        catch (SQLException e) {
            throw new IllegalStateException("Cannot connect the database!\n", e);
        }
    }

    public ArrayList<String> getAllRooms() {

        ArrayList<String> ans = new ArrayList<>();
        try(Connection connection = DriverManager.getConnection(url, rootName, rootPassword)) {
            Statement stmt = connection.createStatement();
            ResultSet rs;
            rs = stmt.executeQuery("SELECT roomName from rooms");
            while(rs.next())
            {
                String tmp = rs.getString("roomName");
                ans.add(tmp);
            }
            connection.close();
        }
        catch (SQLException e) {
            throw new IllegalStateException("Cannot connect the database!\n", e);
        }
        return ans;
    }

    public Boolean createRoom(String newRoom) {

        try(Connection connection = DriverManager.getConnection(url, rootName, rootPassword)) {

            Statement                   stmt = connection.createStatement();
            int                         boardID = 1; //Can change when more boards are added.
            String                      newBoardStart = getBoard(boardID);
            String                      newBoardFinish = getSolution(boardID);
            ResultSet                   rs;

            rs = stmt.executeQuery("select roomName from rooms where roomName = '"+newRoom+"'");
            if(rs.next() == true)
            {
                connection.close();
                return false;
            }
            else
            {
                stmt.executeUpdate("INSERT into rooms VALUES('"+newRoom+"', '"+boardID+"' , '"+newBoardStart+"', '"+newBoardFinish+"', '"+newBoardStart+"')");
                return true;
            }
        }
        catch (SQLException e) {
            throw new IllegalStateException("Cannot connect the database!\n", e);
        }
    }
}
