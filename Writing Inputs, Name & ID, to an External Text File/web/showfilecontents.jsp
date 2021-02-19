<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%> 
<%@page import="java.io.InputStream"%>

<% 
    String fileName = "/Users/diazj/Downloads/hwk2.txt"; 
    
// creating an InputStream to read the file    
InputStream ins = new FileInputStream(fileName);   
try    { 
    if(ins == null) out.println("text file not found"); 
    
        else {            
        
        InputStreamReader isr = new InputStreamReader(ins);       
        BufferedReader br = new BufferedReader(isr);           
        String fileLine;           
        out.println("<table border='1'><tr><th>File Contents</th></tr>");        
        
            while((fileLine= br.readLine())!= null) 
                out.println("<tr><td>"+fileLine+"</td></tr>");         
            out.println("</table>"); 
    }     
}
catch(Exception e) { 
    out.println(e.getMessage());
} 
%>
