import java.sql.*;
import java.util.ArrayList;

public class SudokuBoard {

    private String                  roomName;
    private Integer                 ID;
    private ArrayList<String>       collaborators = new ArrayList<String>();
    private Double                  timeAlive;

    public SudokuBoard(String roomName){
        this.roomName = roomName;

    }

    public int[] checkSolution() {
        Database    d = Database.getInstance();
        String      currentBoard = d.getBoard(this.ID);  //will have to change based off rooms table
        String      solution = d.getSolution(this.ID);

        int[] incorrect = new int[81];

        int boardLength = 80;
        int numCorrect = 0;

        for (int i = 0; i < boardLength; i++)
        {
            if ( ( currentBoard.charAt(i) != solution.charAt(i) ) && (currentBoard.charAt(i) != 0))
            {
                incorrect[i] = 1;
            }
        }

        return incorrect;
    }

    public void updateBox(char strToChange, int index) {
        Database        d = Database.getInstance();
        String          board = getRoomBoard();

        StringBuilder   str = new StringBuilder(board);

        str.setCharAt(index , strToChange); //unsure if index is right. have to test later

        d.updateBoard(this.roomName, str.toString());
    }

    public String getRoomBoard() {

        try(Connection connection = DriverManager.getConnection(Database.url, Database.rootName, Database.rootPassword)) {
            Statement stmt = connection.createStatement();
            ResultSet rs;

            rs = stmt.executeQuery("SELECT currentBoard FROM rooms where roomName = '"+this.roomName+"'");
            if(rs.next() == false)
                System.out.println("error");
            else
            {
                String board = rs.getString("currentBoard");
                connection.close();
                return board;
            }
        }
        catch (SQLException e) {
            throw new IllegalStateException("Cannot connect the database!", e);
        }
        return "";
    }

}

