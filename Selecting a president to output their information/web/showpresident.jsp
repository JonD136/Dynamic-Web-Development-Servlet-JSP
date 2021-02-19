<%-- Document : showpresident.jsp --%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%
    try {
        //reading the passing variable (selected president)
        String president = request.getParameter("nameKey");

        //connecting to the database
        String database = "jdbc:mysql://localhost:8889/uspresidentsdb?";
        String user = "root";
        String pwd = "root";

        //loading jdbc Driver
        Class.forName("com.mysql.jdbc.Driver");

        //creating Connection object
        Connection mycon = DriverManager.getConnection(database, user, pwd);

        //creating String SQl select
        String SQLselect = "select * from uspresidentsdb_table where name='" + president + "'";

        //creating a Statement object
        Statement mystat = mycon.createStatement();

        //creating ResultSet object
        ResultSet results = mystat.executeQuery(SQLselect);

        boolean foundname = false;

        //field values
        String presname = "", dob = "", state = "", party = "", term = "", image = "";

        while (results.next()) {
            foundname = true;
            presname = results.getString("name");
            dob = results.getString("dob");
            state = results.getString("statebirth");
            party = results.getString("party");
            term = results.getString("termoffice");
            image = results.getString("picture");
            break;
        }

        if (foundname == true) {
            out.println("<table><tr><td colspan='2'><img src='" + image + "'/></td></tr>");
            out.println("<tr><td>Name</td><td>" + presname + "</td></tr>");
            out.println("<tr><td>Date of Birth</td><td>" + dob + "</td></tr>");
            out.println("<tr><td>State of Birth</td><td>" + state + "</td></tr>");
            out.println("<tr><td>Party</td><td>" + party + "</td></tr>");
            out.println("<tr><td>Term of Office</td><td>" + term + "</td></tr>");
            out.println("</table>");
        } else {
            out.println("President name not found");
        }
    } catch (Exception e) {
    }
%>
