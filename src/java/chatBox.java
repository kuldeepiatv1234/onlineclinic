
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "chat", urlPatterns = "/ch")
public class chatBox extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String path = req.getParameter("path");
        String msg = req.getParameter("msg");
        String res1 = req.getParameter("doctor_email");
        String res2 = req.getParameter("patient_email");
        System.out.println("java class me msg:" + msg);
        System.out.println("java class me res1:" + res1);
        System.out.println("java class me res2:" + res1);
        int p_id=0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_clinic", "root", "root");
            String query="select P_ID from Persons where patient_email='"+res2+"'"; 
            PreparedStatement ps=cnn.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                p_id=rs.getInt("P_ID");
            }
            
            System.out.println("P_ID :"+p_id);
            String query1="insert into Orders(msg,P_ID) values(?,?);"; 
            PreparedStatement ps1=cnn.prepareStatement(query1);
            ps1.setString(1, msg);
            ps1.setInt(2, p_id);
            ps1.executeUpdate();
            
            resp.sendRedirect("chatBox.jsp?result=" + res1 + "&result1=" + res2+"&path="+path);
        } catch (ClassNotFoundException ex) {
            System.out.println("Class not found!");
        } catch (SQLException ex) {
            System.out.println("Sql Exception!");

        }
    }
}
