
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "patient_login", urlPatterns = "/pt")
public class Patient_Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String b = "false";
        try {
            String email = req.getParameter("email");
            String passwd = req.getParameter("passwd");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/online_clinic", "root", "root");
            String query = "select * from patient_register where email='" + email + "' ;";
            PreparedStatement ps = (PreparedStatement) cnn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            String new_email = "";
            String new_passwd = "";
            while (rs.next()) {
                new_email = rs.getString("email");
                new_passwd = rs.getString("passwd");
                if (email.equals(new_email) && passwd.equals(new_passwd)) {

                    resp.sendRedirect("dashboard.jsp?result=" + email);
                } else {
                    resp.sendRedirect("patient_login.jsp?result=" + b);
                }
            }

        } catch (ClassNotFoundException ex) {
            resp.sendRedirect("patient_login.jsp?result=" + b);
            System.out.println("class not found");
        } catch (SQLException ex) {
            resp.sendRedirect("patient_login.jsp?result=" + b);
            System.out.println("Sql exception");
        }
    }
}
