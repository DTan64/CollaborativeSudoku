import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

@WebServlet("/ShowStatisticsServlet")
public class ShowStatisticsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException
    {
        response.sendRedirect("statistics.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        Hashtable<String, Double>   stats;
        HttpSession                 session = request.getSession();
        String                      playerName = (String)session.getAttribute("email");
        String                      playerPassword = (String)session.getAttribute("password");
        Player                      p = new Player(playerName, playerPassword);

        p.getNewStats();
        stats = p.getStats();
        double                      gamesPlayed = stats.get("gamesPlayed");
        double                      moves = stats.get("moves");
        double                      wins = stats.get("wins");
        String                      data = Double.toString(gamesPlayed) + "," + Double.toString(moves) + "," + Double.toString(wins);
        response.getWriter().write(data);
    }

}
