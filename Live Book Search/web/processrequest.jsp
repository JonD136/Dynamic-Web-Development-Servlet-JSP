<%-- Document   : processrequest.jsp --%> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%> 
<%
    try {
        //let's connect to the database bookdb   
        //need to set up the parameters required to create    
        //a Connection object        
        String database = "jdbc:mysql://localhost:8889/books";
        String user = "root";
        String password = "root";

//loading jdbc Driver      
        Class.forName("com.mysql.jdbc.Driver");

//now we can create object Connection      
        Connection mycon = DriverManager.getConnection(database, user, password);

//creating a Statement object to run SQLs       
        Statement mystat = mycon.createStatement();

//which process what we doing        
        String process = request.getParameter("stepKey");

//String SQLselect       
        String SQLselect = "", theBook = "";

        if (process.equals("populate")) {

//let's get the user input from the HTML         
            String userChar = request.getParameter("characterKey");

//create String that holds SQL select          
            SQLselect = "select * from books_table where isbn like '%"
                    + userChar + "%' or author like '%" + userChar
                    + "%' or title like '%" + userChar + "%'";

//run by creating an object of class ResultSet         
            ResultSet results = mystat.executeQuery(SQLselect);
            boolean foundrec = false;

            if (results.next()) {
                foundrec = true;

//step back one record by moving the 'pointer' back one record   
                results.beforeFirst();

//let's start sending back to HTML the select element              
                out.println("<select id='bookList' size='10' onchange='processrequest(2)'>");

//now looping through all records              
                while (results.next()) {

//get the values of the fields author and title
                    String mauthor = results.getString("author");
                    String mtitle = results.getString("title");

//showing these as the value of the option                
                    out.println("<option value='" + mauthor + "'>" + mauthor + "," + mtitle + "</option>");
                }

                out.println("</select>");

            }

            if (foundrec == false) {
                out.println("No record(s) found");
            }

        } else if (process.equals("showbook")) {

//reading the passing selected book          
            theBook = request.getParameter("bookKey");

//creating a String mysql select to filter those records that match the book value   
            SQLselect = "select * from books_table where author='" + theBook + "'";

            ResultSet results2 = mystat.executeQuery(SQLselect);

            boolean foundbook = false;

            while (results2.next()) {
                foundbook = true;

//get the all the info of the matched book          
                String mauthor = results2.getString("author");
                String mtitle = results2.getString("title");
                String misbn = results2.getString("isbn");

                out.println("Author: " + mauthor + "<br/>"
                        + "Title: " + mtitle + "<br/>"
                        + "ISBN: " + misbn);
            }
        }

    } catch (Exception e) {
    }

%>