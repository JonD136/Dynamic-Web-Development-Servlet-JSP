<%-- Document   : showpresident.jsp --%>
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%> 
<%
    try {

//reading the passing variable (selected city)      
        String c = request.getParameter("nameKey");

//connecting to the database        
        String database = "jdbc:mysql://localhost:3306/citytour";
        String user = "root";
        String pwd = "";

//loading jdbc Driver       
        Class.forName("com.mysql.jdbc.Driver");

//creating Connection object       
        Connection mycon = DriverManager.getConnection(database, user, pwd);

        //just checking if it works at this line...
        out.println("Working ..." + "<br><br>");

        //creating String SQl select       
        String SQLselect = "select * from citytour_table where city='" + c + "'";

//creating a Statement object       
        Statement mystat = mycon.createStatement();

//creating ResultSet object       
        ResultSet results = mystat.executeQuery(SQLselect);

        boolean foundcity = false;

        String city = "", toursites = "";

//now looping through all              
        while (results.next()) {
            foundcity = true;

//get the values of the fields city and toursites
            city = results.getString("city");
            toursites = results.getString("toursites");
            break;
        }
//showing these as the value of the option 
        if (foundcity == true) {
            out.println("<table><tr><td colspan='2'></td></tr>");
            out.println("<tr><td>City:</td><td>" + city + "</td></tr>");
            out.println("<tr><td>Tour Site: </td><td>" + toursites + "</td></tr>");

            out.println("</table>");

        } else {
            out.println("No city found");
        }

    } catch (Exception e) {

    }
%> 