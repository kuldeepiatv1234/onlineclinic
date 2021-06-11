
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

@WebServlet(name="login_doctor" , urlPatterns="/dr")
public class Dummy 
{
    
     protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        String b="false";
        try 
        {
            //String doctor=req.getParameter("doctor");
            String email=req.getParameter("email");
            String passwd=req.getParameter("passwd");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cnn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment","root","root");
            String query = "select * from doctors where email='"+email+"' ;"; 
            PreparedStatement ps = (PreparedStatement) cnn.prepareStatement(query);
                        
            ResultSet rs = ps.executeQuery();
            String doctor="";
            String new_email="";
            String new_passwd=""; 
            while(rs.next())
            {
                //int id=rs.getInt("id");
                new_email = rs.getString("email");
                new_passwd = rs.getString("passwd");
                doctor=rs.getString("name");
                if(email.equals(new_email) && passwd.equals(new_passwd))
                {
                    //resp.sendRedirect("doctor_appoint_list.jsp?doctor="+doctor);
            System.out.println("Yaha tak");
                    String query1 = "select * from patient_appoint where doctor='"+doctor+"' ;";
            PreparedStatement ps1 = (PreparedStatement) cnn.prepareStatement(query1);
            PrintWriter pw=resp.getWriter();
            ResultSet rs1 = ps1.executeQuery();
            pw.print("<html>");
            
            //String s="background-color: #e4e7ee;";   
            pw.print("<body style='background-color:#e4e7ee;'>");

            pw.print("<center><h1>Patient Appointment List</h1></center><br>");
            int id1=0;
            String name="";
            String contact="";
            String problem="";
            String doctor1="";
            String date="";
            String time="";
            String img="";
                    
            while(rs1.next())
            {
                int id=5;
                name=rs1.getString("name");
                contact=rs1.getString("contact");
                problem=rs1.getString("problem");
                doctor1=rs1.getString("doctor");
                date=rs1.getString("date");
                time=rs1.getString("time");
                img=rs1.getString("img");
                System.out.println("Image:"+img);
                                //pw.print("background-color: #e4e7ee;");
                                
                String card="<center><div class=\"card\" style=\"border-style:solid;border-color:blue;"
                        + "border-radius:30px;border-width:5px;width:380px;padding: 20px;text-align:left;\">\n" +
                    "  <img src=\"img/item1.jpg\" alt=\"Avatar\" style=\"width:350px;text-align:centre;border-radius:50%\">\n" +
                    "  <div class=\"container\" style=\"width:350px;text-align:centre;\">\n" +
                    "    <h2><b>"+name+"</b></h2>\n" +
                    "    <h3>Patient id  : "+id+"</h3>\n" +
                    "    <h3>Patient contact  : "+contact+"</h3>\n" +
                    "    <h3>Patient problem  : "+problem+"</h3>\n" +
                    "    <h3>Patient's doctor name   : "+doctor1+"</h3>\n" +
                    "    <h3>Patient appointment date  : "+date+"</h3>\n" +
                    "    <h3>Patient appointment time  : "+time+"</h3>\n" +
                       
                    "  </div>\n" +
                    "</div></center>";    
                pw.print(card);
//                pw.print("<h3>------------------------------</h3>");
//                pw.print("<h1>Patient details</h1><br>");
//                pw.print("<h3>Patient id  : "+id+"</h3>");
//                pw.print("<h3>Patient name : "+name+"</h3>");
//                pw.print("<h3>Patient Contact : "+contact+"</h3>");
//                pw.print("<h3>Patient problem : "+problem+"</h3>");
//                pw.print("<h3>Patient's doctor name : "+doctor1+"</h3>");
//                pw.print("<h3>Appoint date : "+date+"</h3>");
//                pw.print("<h3>Appoint time : "+time+"</h3>");
//                pw.print("<h3>------------------------------</h3><br><br>");
                   pw.print("<br><br>");
            }
             //pw.print("</body></html>");
                    
                }
                else
                {
                    b="false";
                    resp.sendRedirect("doctor_login.jsp?result="+b);
                }
            }
            
        }
        catch (ClassNotFoundException ex) 
        {
           resp.sendRedirect("doctor_login.jsp?result="+b);
            System.out.println("class not found");
        }
        catch (SQLException ex) 
        {
           resp.sendRedirect("doctor_login.jsp?result="+b);
            System.out.println("Sql exception");
        }
    }
}

