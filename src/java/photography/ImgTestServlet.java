/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package photography;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) // for max 16 MB images

public class ImgTestServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Connection conn = null;

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Open a connection
            conn = DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");

            // Insert the movie into the database
            String sql = "INSERT INTO testimg (name, img) values (?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
            InputStream fileContent = filePart.getInputStream();
            String fileName = filePart.getSubmittedFileName();
            long fileSize = filePart.getSize();
            statement.setBinaryStream(2, fileContent, (int) fileSize);

            int row = statement.executeUpdate();

            if (row > 0) {
                System.out.println(name);
                response.sendRedirect("http://localhost:8080/photography/ImageTest.jsp?status=success");

            } else {
                response.sendRedirect("http://localhost:8080/photography/ImageTest.jsp?status=failed");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImgTestServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ImgTestServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
