<%-- Document   : getcourses.jsp --%>
<%@page import="java.io.BufferedReader"%> 
<%@page import="java.io.InputStreamReader"%> 
<%@page import="java.io.InputStream"%> 
<%@page import="java.io.FileInputStream"%> 
<%
    try {

        //reading passing professor's name        
        String pName = request.getParameter("nameKey");

        //will read csv and get courses
        String fileName = "C:/Users/class.CST.000/Downloads/midA_years.csv";;

        InputStream ins = new FileInputStream(fileName);
        
        if (ins == null) out.println("File not Found");
        
        else {

            InputStreamReader isr = new InputStreamReader(ins);
            BufferedReader reader = new BufferedReader(isr);

            String fileLine = "";

            //skipping the first line of the csv file           
            int firstReading = 1;
            
            String courses = "", faculty = "";
            
            Boolean foundprof = false;

            while ((fileLine = reader.readLine()) != null) {
                
                if (firstReading == 1) firstReading = 2;
                
                else {
                    
                    String lineArray[] = fileLine.split(",");

                    //size of array               
                    int lineArraySize = lineArray.length;
                    
                    faculty = lineArray[0];

                    if (faculty.equalsIgnoreCase(pName)) {
                        
                        for (int i = 2; i < lineArraySize; i++) {
                            
                            courses += "<li>" + lineArray[i] + "</li>";
                        }

                        foundprof = true;

                    }

                }

            }

            if (foundprof == true) out.println("year: " + pName + "<br/>"
                        + "<br/>y:<br/><ul>" + courses + "</ul>");
            
            else  out.println("year not found");
           
        }

        }

    catch (Exception e) {}

%>