<%-- Document : populateURL.jsp --%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.File"%>
<%
    try {

        //sending back to HTML the select element
       
        out.println("<br>");
        out.println("<br>");
        out.println("<a href='/project/showNBA.jsp'>Displays all the information on all of the teams</a> <br>");
        out.println("<a href='/project/showNBAOldest5.jsp'>Displays the top five oldest teams</a><br>");
        out.println("<a href='/project/showNBANewest5.jsp'>Display the top five most recently founded teams</a>");

       

    } catch (Exception e) {
    }
%>


