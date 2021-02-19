<%-- Document   : process.jsp --%> 
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.Statement"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%> 
<%
    try {
        //accessing database distancenycapital, setting the parameters for the Connection object    
        String database = "jdbc:mysql://localhost:1527/distancenytocapital";
        String user = "root";
        String pwd = "root";

        //loading the jdbc Driver     
        Class.forName("com.mysql.jdbc.Driver");

        //now we can create an object of class Connection    
        Connection mycon = DriverManager.getConnection(database, user, pwd);

//we need an object Statement to run SQLs       
        Statement mystat = mycon.createStatement();
        String SQLselect = "";

//checking which process: populating select list or displaying results, reading the processKey    
        String processType = request.getParameter("processKey");
        if (processType.equals("populateselect")) {

//creating a SQL select String        
            SQLselect = "select country,capital from distancenytocapital_table";

            //running the SQL results in the creation of an object of ResultSet        
            ResultSet results = mystat.executeQuery(SQLselect);
            //let's start sending back the <select> element         
            out.println("<select id='capitalcountryList' onchange='runjQuery(1)'>");
            out.println("<option value=''>Select a Capital, Country</option>");

            while (results.next()) {

//retrieving the fields' values               
                String mcountry = results.getString("country");
                String mcapital = results.getString("capital");
                out.println("<option value='" + mcapital + "'>" + mcapital + ", " + mcountry + "</option>");
            }
            out.println("</select>");
        } else if (processType.equals("showresults")) {
            String selectedCapital = request.getParameter("capitalKey");
            SQLselect = "select * from distancenytocapital_table where capital='"
                    + selectedCapital + "'";
            ResultSet results2 = mystat.executeQuery(SQLselect);

            while (results2.next()) {
                int dKm = results2.getInt("dkm");
                int dMiles = results2.getInt("dmiles");
                out.println("The distance between NY and "
                        + selectedCapital + " is "
                        + dMiles + " miles or "
                        + dKm + " Kilometers");
            }
        }
    } catch (Exception e) {
    }
%>