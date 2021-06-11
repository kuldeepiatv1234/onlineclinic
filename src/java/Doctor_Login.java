
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "doctor_login", urlPatterns = "/dr")
public class Doctor_Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String b = "false";
        try {
            String email = req.getParameter("email");
            String passwd = req.getParameter("passwd");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/online_clinic", "root", "root");
            String query = "select * from doctor_register where email='" + email + "' ;";
            PreparedStatement ps = (PreparedStatement) cnn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            String new_email = "";
            String new_passwd = "";
            String photo = "";
            
            while (rs.next()) {
                new_email = rs.getString("email");
                new_passwd = rs.getString("passwd");
                photo=rs.getString("img");
                if (email.equals(new_email) && passwd.equals(new_passwd)) {
                    resp.sendRedirect("patient_list.jsp?result=" + email+"&path="+photo);
                }
                else 
                {
                    resp.sendRedirect("doctor_login.jsp?result=" + b);
                }
            }

        } catch (ClassNotFoundException ex) {
            resp.sendRedirect("doctor_login.jsp?result=" + b);
            System.out.println("class not found");
        } catch (SQLException ex) {
            resp.sendRedirect("doctor_login.jsp?result=" + b);
            System.out.println("Sql exception");
        }

    }
}
