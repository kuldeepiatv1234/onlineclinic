
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
@WebServlet(name = "register_patient", urlPatterns = "/ptn_reg")
public class Patient_Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String b = "false";
        try {
            String fname = req.getParameter("fname");
            String lname = req.getParameter("lname");
            String gender = req.getParameter("gender");
            String date = req.getParameter("date");
            String address = req.getParameter("address");
            String current_problem = req.getParameter("current_problem");
            String contact = req.getParameter("contact");
            String disease = req.getParameter("disease");
            String age = req.getParameter("age");
            String country = req.getParameter("country");
            Part part = req.getPart("file1");
            String description = req.getParameter("description");
            String email = req.getParameter("email");
            String passwd = req.getParameter("passwd");

            Class.forName("com.mysql.jdbc.Driver");
            Connection cnn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/online_clinic", "root", "root");

            String fileName = part.getSubmittedFileName();
            String fileLocation = fileName;
            part.write(fileLocation);
            System.out.println(fileLocation);
            File f = new File(fileLocation);
            String absolute = f.getAbsolutePath();
            String link = "upload_images_patient/" + fileLocation;

            //start
            String img_checker2 = "";
            String img_checker1 = "";
            String query1 = "select img from doctor_register where img='" + link + "';";
            PreparedStatement ps1 = (PreparedStatement) cnn.prepareStatement(query1);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                img_checker2 = rs1.getString("img");
                System.out.println("IMg_checker2:" + img_checker2);
            }

            String query3 = "select img from patient_register where img='" + link + "';";
            PreparedStatement ps3 = (PreparedStatement) cnn.prepareStatement(query3);
            ResultSet rs3 = ps3.executeQuery();

            while (rs3.next()) {
                img_checker1 = rs3.getString("img");
                System.out.println("IMg_checker1:" + img_checker1);

            }
            System.out.println("IMg_checker2_let;s:" + link);
            if ((img_checker1.equals("")) && (img_checker2.equals(""))) {
                System.out.println("hhhhhhhhh");
            Path temp = Files.copy(Paths.get("C:\\Users\\ASUS\\Desktop\\Some_Images_upload_Project\\" + fileLocation),
                    Paths.get("C:\\Users\\ASUS\\Documents\\NetBeansProjects\\Doctor_Patient_Appointment\\web\\upload_images_patient\\" + fileLocation));
            }

            //end

            if (!"".equals(email) || !"".equals(passwd)) {

                PreparedStatement stm = (PreparedStatement) cnn.prepareStatement("insert into patient_register(fname,lname,gender,"
                        + "date,address,current_problem,contact,disease,age,country,img,description,email,passwd) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?);");

                stm.setString(1, fname);
                stm.setString(2, lname);
                stm.setString(3, gender);
                stm.setString(4, date);
                stm.setString(5, address);
                stm.setString(6, current_problem);
                stm.setString(7, contact);
                stm.setString(8, disease);
                stm.setString(9, age);
                stm.setString(10, country);
                stm.setString(11, link);
                stm.setString(12, description);
                stm.setString(13, email);
                stm.setString(14, passwd);
                System.out.println("or yaha");
                stm.executeUpdate();
                b = "true";
                resp.sendRedirect("patient_register.jsp?result=" + b);
            } else {

                resp.sendRedirect("patient_register.jsp?result=" + b);
            }
        } catch (ClassNotFoundException ex) {
            resp.sendRedirect("patient_register.jsp?result=" + b);
            System.out.println("class not found");
        } catch (SQLException ex) {
            resp.sendRedirect("patient_register.jsp?result=" + b);
            System.out.println("Sql exception");
        }
    }
}
