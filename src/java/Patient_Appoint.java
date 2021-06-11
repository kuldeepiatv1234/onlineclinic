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

@WebServlet(name="patient_app" , urlPatterns="/ptn_appoint")
public class Patient_Appoint extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        String b="false";
        try 
        {
            String name=req.getParameter("name");
            String contact=req.getParameter("contact");
            String problem=req.getParameter("problem");
            String doctor=req.getParameter("doctor");
            String date=req.getParameter("date");
            String time=req.getParameter("time");
            String img=req.getParameter("image");
            System.out.println("img"+img);
            Class.forName("com.mysql.jdbc.Driver");
            Connection cnn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment","root","root");
            PreparedStatement stm=(PreparedStatement) cnn.prepareStatement("insert into patient_appoint(name,contact,problem,doctor,date,time) values(?,?,?,?,?,?);");
            stm.setString(1, name);
            stm.setString(2,contact);
            stm.setString(3, problem);
            stm.setString(4,doctor);
            stm.setString(5,date);
            stm.setString(6,time);
            stm.setString(7,img);
            stm.executeUpdate();
            b="true";
            resp.sendRedirect("patient_appoint.jsp?result="+b);
            
        }
        catch (ClassNotFoundException ex) 
        {
            resp.sendRedirect("patient_appoint.jsp?result="+b);
            System.out.println("class not found");
        }
        catch (SQLException ex) 
        {
            resp.sendRedirect("patient_appoint.jsp?result="+b);
            System.out.println("Sql exception");
        }
    }
}
