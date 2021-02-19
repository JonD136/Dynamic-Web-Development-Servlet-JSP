<%-- Document   : populateselect.jsp --%> 
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%> 
<%

    //will read csv and populate a select element    
    String fileName = "C:/Users/class.CST.000/Downloads/midA_years.csv";
    InputStream ins = new FileInputStream(fileName);

    try {
        if (ins == null) out.println("File not Found");

        else {

            InputStreamReader isr = new InputStreamReader(ins);
            BufferedReader reader = new BufferedReader(isr);
int matchCounter = 0;
            String fileLine = "";

            //skipping the first line of the csv file     
            int firstReading = 1;
            out.println("<select id='profList' onchange='showprofinfo()'>");
            out.println("<option value=''>Select year of birth</option>");

            while ((fileLine = reader.readLine()) != null) {

                if (firstReading == 1) firstReading = 2;
                else {

                    String lineArray[] = fileLine.split(",");
                    String year = lineArray[0];
                    out.println("<option value='" + year + "'>" + year + "</option>");
                   
 
 }

                }
            }

            out.println("</select>");
    }
        

        

     catch (Exception e) {}

%>
