<%-- Document   : showLocation.jsp --%>
<%@page import="java.io.BufferedReader"%> 
<%@page import="java.io.InputStreamReader"%> 
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.FileInputStream"%> 
<%
    try {

        //reading passing animal's name        
        String animal = request.getParameter("nameKey");

        //will read csv and get courses
        String fileName = application.getRealPath("csv/finalA.csv");
    
        InputStream ins = new FileInputStream(fileName);

        if (ins == null) {
            out.println("File not Found");
        } else {

            InputStreamReader isr = new InputStreamReader(ins);
            BufferedReader reader = new BufferedReader(isr);

            String fileLine = "";

            //skipping the first line of the csv file           
            int firstReading = 1;

            while ((fileLine = reader.readLine()) != null) {

                if (firstReading == 1) {
                    firstReading = 2;
                } else {

                    String lineArray[] = fileLine.split(",");
                    String animalCheck = lineArray[0];
                    String location = lineArray[1];
                    String URL = lineArray[2];
                    
                    if (animalCheck.equalsIgnoreCase(animal)) {

                        out.println("Location: " );
                        out.println("<a href= " + URL +  ">" + location + "</a>" );
                    }

                }

            }
        }
    } catch (Exception e) {
    }

%>


<%-- incase for sql


<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%> 
<%
    try {

//reading the passing variable (selected team)      
        String t = request.getParameter("nameKey");

        //connecting to the database        
        String database = "jdbc:mysql://localhost:3306/nba";
        String user = "root";
        String pwd = "";

//loading jdbc Driver       
        Class.forName("com.mysql.jdbc.Driver");

//creating Connection object       
        Connection mycon = DriverManager.getConnection(database, user, pwd);

        //creating String SQl select       
        String SQLselect = "select * from nba_table where id " + t + " ";

//creating a Statement object       
        Statement mystat = mycon.createStatement();

//creating ResultSet object       
        ResultSet results = mystat.executeQuery(SQLselect);

        boolean foundregion = false;

        String teams = "";

        out.println("</br>");

//now looping through all              
        while (results.next()) {
            if (foundregion = true) {

//get the values of the fields teams
                teams = results.getString("teams");

                out.println("<ul> <li value='" + teams + "'>  " + teams + "</li> </ul>");

            } else {
                out.println("No region found");
            }

        }

    } catch (Exception e) {

    }
%> 

--%>