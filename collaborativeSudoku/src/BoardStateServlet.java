import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

@WebServlet("/boardServlet")
public class BoardStateServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession     session = request.getSession();
        String          roomName = (String) session.getAttribute("roomID");
        SudokuBoard     roomBoard = new SudokuBoard(roomName);
        String          board = roomBoard.getRoomBoard();

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(board);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        HttpSession     session = request.getSession();
        String          roomName = (String) session.getAttribute("roomID");
        int             cellIndex = Integer.valueOf( request.getParameter( "cellNum" ) );
        char            newCellVal =  ( request.getParameter("cellVal")).charAt(0);
        SudokuBoard     roomBoard = new SudokuBoard(roomName);

        roomBoard.updateBox(newCellVal, cellIndex);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(roomName);
    }
}
