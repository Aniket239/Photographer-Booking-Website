package photography;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;

public class LoginServlet extends HttpServlet {

    String username, email, password, phone, DOB, gender;
    OracleConnection oconn;
    OraclePreparedStatement ost;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String pass = request.getParameter("pass");
            String role = request.getParameter("role");
            int database = 0;
            System.out.println(role);
            if (role.equalsIgnoreCase("photographer")) {
                database = 1;
            }
            if (database == 0) {
                try {
                    int f = 0;
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");
                    PreparedStatement ps;
                    ps = con.prepareStatement("select username,password from users");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        String dbname = rs.getString("username");
                        String dbpass = rs.getString("password");
                        if (name.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("admin")) {
                            f = 2;
                            break;
                        } else if (dbname.equals(name) && dbpass.equals(pass)) {
                            f = 1;
                            break;
                        }
                    }
                    if (f == 2) {
                        response.sendRedirect("UserDetails.jsp");

                    } else if (f == 1) {

                        request.setAttribute("user", name);
                        request.setAttribute("role", role);

                        // Forward the request to the JSP page
                        RequestDispatcher dispatcher = request.getRequestDispatcher("mainpage.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        // Set the value to be passed to the HTML file
                        String myValue = "Invalid Username or Password";
                        // Set the value as a request attribute
                        request.setAttribute("myValue", myValue);
                        // Forward the request to the HTML file
                        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                        dispatcher.forward(request, response);

                    }

                } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
                    out.print(e);
                }
            } else {
                try {
                    int f = 0;
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");
                    PreparedStatement ps;
                    ps = con.prepareStatement("select username,password from photographers");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        String dbname = rs.getString("username");
                        String dbpass = rs.getString("password");
                        if (name.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("admin")) {
                            f = 2;
                            break;
                        } else if (dbname.equals(name) && dbpass.equals(pass)) {
                            f = 1;
                            break;
                        }
                    }
                    if (f == 2) {
                        response.sendRedirect("UserDetails.jsp");

                    } else if (f == 1) {
                        request.setAttribute("user", name);
                        request.setAttribute("role", role);

                        // Forward the request to the JSP page
                        RequestDispatcher dispatcher = request.getRequestDispatcher("mainpage.jsp");
                        dispatcher.forward(request, response);

                    } else {
                        // Set the value to be passed to the HTML file
                        String myValue = "Invalid Username or Password";
                        // Set the value as a request attribute
                        request.setAttribute("myValue", myValue);
                        // Forward the request to the HTML file
                        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                        dispatcher.forward(request, response);

                    }
                } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
                    out.print(e);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("http://localhost:8080/photography/signup.jsp");
        dispatcher.forward(request, response);
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
