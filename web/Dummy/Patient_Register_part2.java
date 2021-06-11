
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name="register_patient1" , urlPatterns="/ptn_reg1")
public class Patient_Register_part2 
{

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        //String b="false";
        try 
        {
            
            
            
            
//            <!--                        
//                    <div class="form-group">
//                      <label for="exampleInputName1">Detail Reports</label>
//                      <input type="text" class="form-control" id="exampleInputName1" placeholder="Name">
//                    </div>
//                    <div class="form-group">
//                      <label for="exampleInputEmail3">Bio</label>
//                      <input type="email" class="form-control" id="exampleInputEmail3" placeholder="Email">
//                    </div>
//                    <div class="form-group">
//                      <label for="exampleInputPassword4">Password</label>
//                      <input type="password" class="form-control" id="exampleInputPassword4" placeholder="Password">
//                    </div>
//                    <div class="form-group">
//                      <label for="exampleSelectGender">Gender</label>
//                        <select class="form-control" id="exampleSelectGender">
//                          <option>Male</option>
//                          <option>Female</option>
//                        </select>
//                      </div>
//                    <div class="form-group">
//                      <label>File upload</label>
//                      <input type="file" name="img[]" class="file-upload-default">
//                      <div class="input-group col-xs-12">
//                        <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
//                        <span class="input-group-append">
//                          <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
//                        </span>
//                      </div>
//                    </div>
//                    <div class="form-group">
//                      <label for="exampleInputCity1">Detail Reports</label>
//                      <input type="text" class="form-control" id="exampleInputCity1" placeholder="Location">
//                    </div>
//                    <div class="form-group">
//                      <label for="exampleTextarea1">Bio</label>
//                      <textarea class="form-control" id="exampleTextarea1" rows="4"></textarea>
//                    </div>
//                    <button type="submit" class="btn btn-primary mr-2">Submit</button>
//                    <button class="btn btn-light">Cancel</button>
//                        -->
            
            
            
            String current=req.getParameter("current");
            String any=req.getParameter("any");
            //if(!"".equals(email) || !"".equals(passwd))
            //{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cnn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/online_clinic","root","root");
            PreparedStatement stm=(PreparedStatement) cnn.prepareStatement("insert into patient_register(current,any) values(?,?);");
            stm.setString(7,current);
            stm.setString(8,any); 
            stm.executeUpdate();
            resp.sendRedirect("patient_register_part2.jsp");
            
           
        }
        catch (ClassNotFoundException ex) 
        {
            //resp.sendRedirect("patient_register_part2.jsp");
            System.out.println("class not found");
        }
        catch (SQLException ex) 
        {
            //resp.sendRedirect("patient_register_part2.jsp");
            System.out.println("Sql exception");
        }
    }
}