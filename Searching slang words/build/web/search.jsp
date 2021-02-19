<%-- Document   : search.jsp --%> 
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%> 
<%

    //reading the team's name  
    String nameIn = request.getParameter("nameKey");
    String fileName = "C:/Users/diazj/Downloads/slangs.csv";
    InputStream ins = new FileInputStream(fileName);

    try {

        if (ins == null) {
            out.println("File not Found");
        } else {

            InputStreamReader isr = new InputStreamReader(ins);
            BufferedReader reader = new BufferedReader(isr);

            int firstLine = 1;

            String fileLine;
            while ((fileLine = reader.readLine()) != null) {

                if (firstLine == 1) {
                    firstLine = 2;
                } else {

                    //creating an array by splitting the line by commas    
                    String lineArray[] = fileLine.split(",");
                    String lineSlang = lineArray[1];
                    String lineMeaning = lineArray[2];

                    if (lineSlang.toUpperCase().contains(nameIn.toUpperCase())) {

                        out.println(lineSlang + ": " + lineMeaning + "<br/>");

                    }

                }

            }

        }

    } catch (Exception e) {
    }

%>