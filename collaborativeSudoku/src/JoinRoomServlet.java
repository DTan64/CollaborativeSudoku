import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Iterator;

@WebServlet("/JoinRoomServlet")
public class JoinRoomServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Database                                d = Database.getInstance();
        ArrayList<String>                       data;
        String res                              = "";

        data = d.getAllRooms();
        Iterator<String> iterator = data.iterator();

        while(iterator.hasNext())
        {
            String tmp = iterator.next();
            res += tmp + ",";
        }

        res = res.substring(0, res.length() - 1);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(res);

    }

}
