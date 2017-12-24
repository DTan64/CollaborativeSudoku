import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

@WebServlet( "/LoginServlet" )
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException
    {

        String          username = request.getParameter( "email" );
        String          password = request.getParameter( "pswd" );
        HttpSession     session = request.getSession();
        Player          p = new Player( username, password );

        session.setAttribute( "email", username );
        session.setAttribute( "password", password );

        if( p.login() )
        {
            response.setContentType( "text/plain" );
            response.setCharacterEncoding( "UTF-8" );
            response.getWriter().write( "true" );
        }
        else
        {
            response.setContentType( "text/plain" );
            response.setCharacterEncoding( "UTF-8" );
            response.getWriter().write( "false" );
        }

    }
}
