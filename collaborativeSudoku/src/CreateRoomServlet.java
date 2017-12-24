import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateRoomServlet")
public class CreateRoomServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        String              name = request.getParameter("roomName");
        Database            d = Database.getInstance();

        if(d.createRoom(name))
        {
            response.getWriter().write("true");
        }
        else
        {
            response.getWriter().write("false");
        }
    }
}