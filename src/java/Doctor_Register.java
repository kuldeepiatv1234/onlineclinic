
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "register_doctor", urlPatterns = "/dr_reg")
public class Doctor_Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String b = "false";
        try {

            String fname = req.getParameter("fname");
            String lname = req.getParameter("lname");
            String gender = req.getParameter("gender");
            String date = req.getParameter("date");
            String category = req.getParameter("category");
            String address = req.getParameter("address");
            String year = req.getParameter("year");
            String city = req.getParameter("city");
            String degree = req.getParameter("degree");
            String country = req.getParameter("country");
            String detail = req.getParameter("detail");
            String fee = req.getParameter("fee");
            String total_patient_checkup = req.getParameter("total_patient_checkup");
            String online_checkup = req.getParameter("online_checkup");
            Part part = req.getPart("file1");
            String description = req.getParameter("description");
            String email = req.getParameter("email");
            String passwd = req.getParameter("passwd");
            String cpasswd = req.getParameter("cpasswd");

            Class.forName("com.mysql.jdbc.Driver");
            Connection cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/online_clinic", "root", "root");
            
            
            String fileName = part.getSubmittedFileName();
            String fileLocation = fileName;
            part.write(fileLocation);
            File f = new File(fileLocation);
            String absolute = f.getAbsolutePath();
            String link = "upload_images_patient/" + fileLocation;

            String query2 = "SELECT COUNT(*) FROM doctor_register;";
            PreparedStatement ps2 = (PreparedStatement) cnn.prepareStatement(query2);
            ResultSet rs2 = ps2.executeQuery();

            int count = 0;
            while (rs2.next()) {
                count = rs2.getInt("COUNT(*)");
            }
            
            String img_checker2="";
            String img_checker1="";
            String query1 = "select img from doctor_register where img='"+link+"';";
            PreparedStatement ps1 = (PreparedStatement) cnn.prepareStatement(query1);
            ResultSet rs1 = ps1.executeQuery();
                while (rs1.next()) {
                   img_checker2=rs1.getString("img");
                        System.out.println("IMg_checker2:"+img_checker2);    
                }
            
            String query3 = "select img from patient_register where img='"+link+"';";
            PreparedStatement ps3 = (PreparedStatement) cnn.prepareStatement(query3);
            ResultSet rs3 = ps3.executeQuery();
            
                while (rs3.next()) {
                    img_checker1=rs3.getString("img");
                    System.out.println("IMg_checker1:"+img_checker1);    
                        
                }
                System.out.println("IMg_checker2_let;s:"+link);
            if ((img_checker1.equals("")) && (img_checker2.equals(""))) 
            {
                System.out.println("hhhhhhhhh");
                Path temp = Files.copy(Paths.get("C:\\Users\\ASUS\\Desktop\\Some_Images_upload_Project\\" + fileLocation),
                        Paths.get("C:\\Users\\ASUS\\Documents\\NetBeansProjects\\Doctor_Patient_Appointment\\web\\upload_images_patient\\" + fileLocation));
            }
            
            
            if (!"".equals(email) || !"".equals(passwd)) {

                PreparedStatement stm = (PreparedStatement) cnn.prepareStatement("insert into doctor_register(fname,lname,gender,date,category,address,year,city,degree,country,"
                        + "detail,fee,total_patient_checkup,online_checkup,img,description,email,passwd) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");

                stm.setString(1, fname);
                stm.setString(2, lname);
                stm.setString(3, gender);
                stm.setString(4, date);
                stm.setString(5, category);
                stm.setString(6, address);
                stm.setString(7, year);
                stm.setString(8, city);
                stm.setString(9, degree);
                stm.setString(10, country);
                System.out.println("fffiilllee yaha:" + fileLocation);
                stm.setString(11, detail);
                stm.setString(12, fee);
                stm.setString(13, total_patient_checkup);
                stm.setString(14, online_checkup);
                stm.setString(15, link);

                stm.setString(16, description);
                stm.setString(17, email);
                stm.setString(18, passwd);
                stm.executeUpdate();

                b = "true";
                resp.sendRedirect("doctor_register.jsp?result=" + b);
            } else {
                resp.sendRedirect("doctor_register.jsp?result=" + b);
            }
        } catch (ClassNotFoundException ex) {
            resp.sendRedirect("doctor_register.jsp?result=" + b);
            System.out.println("class not found");
        } catch (SQLException ex) {
            resp.sendRedirect("doctor_register.jsp?result=" + b);
            System.out.println("Sql exception");
        }
    }
}
