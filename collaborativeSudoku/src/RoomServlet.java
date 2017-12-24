import com.google.gson.Gson;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;


@WebServlet("/roomServlet")
public class RoomServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        String roomName = request.getParameter("roomID");

        HttpSession session = request.getSession();
        session.setAttribute("roomID", roomName);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(roomName);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Database database = Database.getInstance();
        ArrayList<String> availableRooms;

        availableRooms = database.getAllRooms();
        String json = new Gson().toJson(availableRooms);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}