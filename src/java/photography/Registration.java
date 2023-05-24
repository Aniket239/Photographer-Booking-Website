/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package photography;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;

@MultipartConfig(maxFileSize = 16177215) // for max 16 MB images

public class Registration extends HttpServlet {

    private static final long serialVersionUID = 1L;

    String role, username, name, email, password, phone, DOB, gender, address, photoPrice, photoVideoPrice, preWeddingPrice, weddingPrice, commercialPrice, eventPrice, about;
    int age;
    OracleConnection oconn, oconn1;
    OraclePreparedStatement ost, ost1;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            username = request.getParameter("username");
            name = request.getParameter("name");
            email = request.getParameter("email");
            password = request.getParameter("password");
            phone = request.getParameter("phone");
            DOB = request.getParameter("DOB");
            gender = request.getParameter("gender");
            address = request.getParameter("address");
            photoPrice = request.getParameter("photoPrice");
            photoVideoPrice = request.getParameter("photoVideoPrice");
            preWeddingPrice = request.getParameter("preWeddingPrice");
            weddingPrice = request.getParameter("weddingPrice");
            commercialPrice = request.getParameter("commercialPrice");
            eventPrice = request.getParameter("eventPrice");
            about = request.getParameter("about");
            role = request.getParameter("role");
            int database = 0;
            System.out.println(role);

            //STEP 1 : REGISTERING OF THE REQUIRED DRIVER WITH THE JAVA PROGRAM
            //Class.forName("oracle.jdbc.OracleDriver");
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

            //STEP 2: INSTANTIATING THE CONNECTION OBJECT 
            oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");

            if (role.equalsIgnoreCase("photographer")) {
                database = 1;
            }
            if (database == 0) {
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

                //STEP 2: INSTANTIATING THE CONNECTION OBJECT 
                oconn = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");
                //STEP 3: CREATING THE QUERY
                String q = "INSERT INTO USERS(picture,USERNAME,name,EMAIL,PASSWORD,PHONE,DOB,GENDER) values(?,?,?,?,?,?,?,?)";

                //STEP 4: INSTANTIATING STATEMENT OBJECT FOR EXECUTING SQL QUERIES
                ost = (OraclePreparedStatement) oconn.prepareStatement(q);

                //STEP 5: CHANGING THE DATE FORMAT FROM JAVA DATE  TO ORACLE DATE
                SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
                Date date = dt.parse(DOB);
                SimpleDateFormat dt1 = new SimpleDateFormat("dd-MMM-yyyy");
                DOB = dt1.format(date);

                //STEP 6: FILLING THE BLANK VALUES OF THE QUERY MARKED WITH ? 
                Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
                InputStream fileContent = filePart.getInputStream();
                String fileName = filePart.getSubmittedFileName();
                long fileSize = filePart.getSize();
                ost.setBinaryStream(1, fileContent, (int) fileSize);
                ost.setString(2, username);
                ost.setString(3, name);
                ost.setString(4, email);
                ost.setString(5, password);
                ost.setString(6, phone);
                ost.setString(7, DOB);
                ost.setString(8, gender);

                //STEP 7: EXECUTING THE QUERY
                int ra = ost.executeUpdate();

                if (ra > 0) {
                    System.out.println(name);
                    response.sendRedirect("http://localhost:8080/photography/otp.html");

                } else {
                    response.sendRedirect("http://localhost:8080/photography/signup.jsp?");
                }
                ost.close();
                oconn.close();
            } else {
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

                //STEP 2: INSTANTIATING THE CONNECTION OBJECT 
                oconn1 = (OracleConnection) DriverManager.getConnection("jdbc:oracle:thin:@Aniket:1521:orcl", "aniket", "bca");
                //STEP 3: CREATING THE QUERY
                String dateOfBirthString = request.getParameter("DOB");

                if (dateOfBirthString != null && !dateOfBirthString.isEmpty()) {
                    try {
                        LocalDate dateOfBirth = LocalDate.parse(dateOfBirthString);
                        LocalDate currentDate = LocalDate.now();
                        age = Period.between(dateOfBirth, currentDate).getYears();
                        System.out.println("Age: " + age);
                    } catch (DateTimeParseException e) {
                        System.err.println("Invalid date format: " + dateOfBirthString);
                    }
                } else {
                    System.err.println("Date of birth is missing");
                }

                String q1 = "INSERT INTO photographers(picture,USERNAME,name,EMAIL,PHONE,age,photoprice,photovideoprice,preweddingprice,weddingprice,commercialprice,eventprice,about,password,address) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

                //STEP 4: INSTANTIATING STATEMENT OBJECT FOR EXECUTING SQL QUERIES
                ost1 = (OraclePreparedStatement) oconn1.prepareStatement(q1);

                //STEP 6: FILLING THE BLANK VALUES OF THE QUERY MARKED WITH ? 
                Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
                InputStream fileContent = filePart.getInputStream();
                String fileName = filePart.getSubmittedFileName();
                long fileSize = filePart.getSize();
                ost1.setBinaryStream(1, fileContent, (int) fileSize);
                ost1.setString(2, username);
                ost1.setString(3, name);
                ost1.setString(4, email);
                ost1.setString(5, phone);
                ost1.setInt(6, age);
                ost1.setString(7, photoPrice);
                ost1.setString(8, photoVideoPrice);
                ost1.setString(9, preWeddingPrice);
                ost1.setString(10, weddingPrice);
                ost1.setString(11, commercialPrice);
                ost1.setString(12, eventPrice);
                ost1.setString(13, about);
                ost1.setString(14, password);
                ost1.setString(15, address);
                //STEP 7: EXECUTING THE QUERY
                int ra1 = ost1.executeUpdate();
                if (ra1 > 0) {
                    System.out.println(name);
                    request.setAttribute("username", username);
                    request.setAttribute("name", name);

                    RequestDispatcher dispatcher = request.getRequestDispatcher("signupPhoto.jsp");
                    dispatcher.forward(request, response);
                    response.sendRedirect("http://localhost:8080/photography/signupPhoto.jsp?status=success");

                } else {
                    response.sendRedirect("http://localhost:8080/photography/signupPhoto.jsp?status=failed");
                }
                ost1.close();
                oconn1.close();
            }
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
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
