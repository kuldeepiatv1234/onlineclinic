
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name="login_patient" , urlPatterns="/dash")
public class Dashboard {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String b = "false";
        try {
            //Class.forName("com.mysql.jdbc.Driver");
            //Connection cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/online_clinic", "root", "root");
            System.out.println("");
            b="true";
           //resp.sendRedirect("patient_login.jsp?result=" + b);

        } catch (Exception ex) {
            //resp.sendRedirect("patient_login.jsp?result=" + b);
            System.out.println("class not found");
        }
    }

}
