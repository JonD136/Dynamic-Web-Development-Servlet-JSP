<%-- Document   : search.jsp --%>

<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%
   //getting the passing variable (team's name)
   String nameIn = request.getParameter("nameKey");
   
    //storing the file name into a String variable
    String fileName= "D:/CST 4713 - Dynamic Web Development/Homework 4/Homework 4/web/hwk4_superbowl.csv";
    
    //1. create a InputStream from a FileInputStream
    InputStream ins = new FileInputStream(fileName);
    
    try
    {
        if (ins == null) out.println("File not Found");
        else
        {
            //2. create an InputStreamReader of the InputStream object
            InputStreamReader isr = new InputStreamReader(ins);
            
            //3. create a reader from BufferedReader
            BufferedReader reader = new BufferedReader(isr);
            
            int matchCounter = 0;
            int firstLine = 1;
            
            String fileLine = "";
            
            //reading line by line of the csv file
            while ((fileLine = reader.readLine()) != null)
            {
                if (firstLine ==1) firstLine=2;
                else
                {
                    //creating an array by splitting the line in commas
                    String lineArray[] = fileLine.split(",");
                    String lineWinner = lineArray[4];
                    String winnerScore = lineArray[5];
                    
                    if ((lineWinner.toUpperCase().contains(nameIn.toUpperCase())) 
                            || (winnerScore.toUpperCase().contains(nameIn.toUpperCase())))
                    {
                        matchCounter++;
                        out.println(lineWinner + "<br/>");
                    }
                }
            }
            
            if (matchCounter == 0) out.println(nameIn + " never won the superbowl");
            else out.println("<br>" + "Total Wins: " + matchCounter);
        }
    }
    catch(Exception e){}
    
    
    
    
    

%>