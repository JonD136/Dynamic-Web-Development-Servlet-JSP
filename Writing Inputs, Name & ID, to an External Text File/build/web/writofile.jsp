<%-- Document   : writofile.jsp --%> 
<%@page import="java.io.PrintWriter"%> 
<%@page import="java.io.BufferedWriter"%> 
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%> <%   
    
    //getting the passing name, id    
    String userName = request.getParameter("nameKey");    
    String userID = request.getParameter("idKey");    
    String fileInput = userName + ","+ userID;  
    
    FileWriter fw = null;    
    BufferedWriter bw = null;    
    PrintWriter pw = null;     
    
//create the text file    
String nameofTextFile = "/Users/diazj/Downloads/hwk2.txt";   
File theTextFile = new File(nameofTextFile);   

try   {
    fw = new FileWriter(theTextFile,true);        
    bw = new BufferedWriter(fw);      
    pw = new PrintWriter(bw);      
    pw.println(fileInput);        
    out.println("inputs are in the text file and are saved in /Users/diazj/Downloads");    
    pw.flush();   
}    finally    {
        try         {     
            pw.close();           
            bw.close();             
            fw.close();       
        } 
        catch (Exception e) {}   
} 
%>