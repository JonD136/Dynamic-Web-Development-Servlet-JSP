
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%> 
<%
    try {

//reading the passing variable (selected team) 
//Since in the assignment as a hint we can use an id
// to each team as the primary key of the database.
//I sorted the id out in order (1-29) by the year(old-new) of each team
        String t = ">=25 order by id";

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

        boolean foundteam = false;

        String teams = "";

        out.println("</br>");

//now looping through all              
        while (results.next()) {
            if (foundteam = true) {

//get the values of the fields teams
                teams = results.getString("teams");
                String team = teams.split(";")[0];
                out.println("<ul> <li value='" + team + "'>  " + team + "</li> </ul>");

            } else {
                out.println("No team found");
            }

        }

    } catch (Exception e) {

    }
%> 