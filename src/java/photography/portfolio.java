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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)

public class portfolio extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        String user = request.getParameter("user");
        String name = request.getParameter("name");
        String genre = request.getParameter("genre");
        System.out.println(user);
        System.out.println(name);
        System.out.println(genre);

        int count = 0;

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Open a connection
            conn = DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");

            // Insert the movie into the database
            String sql = "select * from photos";
            PreparedStatement statement = conn.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                count++;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(portfolio.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            // Register JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Open a connection
            conn = DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");
            // Insert the movie into the database
            String sql1 = "INSERT INTO photos (photographerid,photoid,photo,genre) values (?,?,?,?)";
            PreparedStatement statement1 = conn.prepareStatement(sql1);
            statement1.setString(1, user);
            statement1.setInt(2, count + 1);
            Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
            InputStream fileContent = filePart.getInputStream();
            String fileName = filePart.getSubmittedFileName();
            long fileSize = filePart.getSize();
            statement1.setBinaryStream(3, fileContent, (int) fileSize);
            statement1.setString(4, genre);

            int row = statement1.executeUpdate();
            if (row > 0) {
                if (genre.equals("wedding")) {
                    request.setAttribute("username", user);
                    request.setAttribute("name", name);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("signupPhoto.jsp?status=success");
                    dispatcher.forward(request, response);
                    
                } else if (genre.equals("portrait")) {
                    request.setAttribute("username", user);
                    request.setAttribute("name", name);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("signup_photo_portrait.jsp?status=success");
                    dispatcher.forward(request, response);
                }
                 else if (genre.equals("travel")) {
                    request.setAttribute("username", user);
                    request.setAttribute("name", name);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("signup_photo_travel.jsp?status=success");
                    dispatcher.forward(request, response);
                }
                 else if (genre.equals("commercial")) {
                    request.setAttribute("username", user);
                    request.setAttribute("name", name);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("signup_photo_commercial.jsp?status=success");
                    dispatcher.forward(request, response);
                }
                 else if (genre.equals("event")) {
                    request.setAttribute("username", user);
                    request.setAttribute("name", name);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("signup_photo_event.jsp?status=success");
                    dispatcher.forward(request, response);
                }   
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(portfolio.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
