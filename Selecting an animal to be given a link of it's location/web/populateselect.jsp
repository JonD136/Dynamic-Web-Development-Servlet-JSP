<%-- Document   : populateselect.jsp --%> 
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%> 
<%

    //will read csv and populate a select element    
    String fileName = application.getRealPath("csv/finalA.csv");
    InputStream ins = new FileInputStream(fileName);

    try {
        if (ins == null) {
            out.println("File not Found");
        } else {

            InputStreamReader isr = new InputStreamReader(ins);
            BufferedReader reader = new BufferedReader(isr);

            String fileLine = "";

            //skipping the first line of the csv file     
            int firstReading = 1;
            out.println("<select id='animalList' onchange='runjQuery2()'>");
            out.println("<option value=''>Select an Animal</option>");

            while ((fileLine = reader.readLine()) != null) {

                if (firstReading == 1) {
                    firstReading = 2;
                } else {

                    String lineArray[] = fileLine.split(",");
                    String animal = lineArray[0];
                    out.println("<option value='" + animal + "'>" + animal + "</option>");
                }
            }

            out.println("</select>");

        }

    } catch (Exception e) {
    }

%>


<%--

 if (ins == null) {
            out.println("File not Found");
        } else {

            InputStreamReader isr = new InputStreamReader(ins);
            BufferedReader reader = new BufferedReader(isr);

            String fileLine = "";

            //skipping the first line of the csv file     
            int firstReading = 1;

            out.println("<table > ");
            out.println("<tr> <th>Animal:</th> <th>Location:</th> </tr>");
            out.println("<tr> <th></th> <th></th> </tr>");
            out.println("<tr> <th></th> <th></th> </tr>");
            while ((fileLine = reader.readLine()) != null) {

                if (firstReading == 1) {
                    firstReading = 2;
                } else {

                    String lineArray[] = fileLine.split(",");
                    String animal = lineArray[0];
                    String location = lineArray[1];
                    String URL = lineArray[2];

                    out.println("<tr> <th>" + animal + "</th>" + "<th>" + "<a href= " + URL + ">" + location + "</a>" + "</th>" + "</tr>" + "<br>");
                }
            }

            out.println("</table> ");
        }

    } catch (Exception e) {
    }

--%>
