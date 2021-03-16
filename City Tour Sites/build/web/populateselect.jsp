<%-- Document : populateselect.jsp --%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.File"%>
<%
    try {
       
        //first we have to read the csv, again using Scanner
        String fileName = "C:/Users/diazj/Desktop/csv/citytoursites.csv";
        
        //creating a File object
        File file = new File(fileName);

        //creating a Scanner object to read the file
        Scanner reader = new Scanner(file);

        //variable String to hold a line of the file
        String fileLine = "";

        //the csv file has a header line so let's skip it
        int firstread = 0;

        //sending back to HTML the select element
        out.println("<select id='cityList' onchange='runjQuery2()'>");
        out.println("<option value=''>Select a City</option>");

        //loop through the file
        while (reader.hasNextLine()) {
            //let's read a line and skip the first line (header line)
            fileLine = reader.nextLine();

            if (firstread == 0) {
                firstread = 1;
            } else {
                String city = fileLine.split(",")[0];

                //send the year back to HTML as a select option
                out.println("<option value='" + city + "'>" + city + "</option>");
            }
        }
        out.println("</select>");
    } catch (Exception e) {
    }
%>


