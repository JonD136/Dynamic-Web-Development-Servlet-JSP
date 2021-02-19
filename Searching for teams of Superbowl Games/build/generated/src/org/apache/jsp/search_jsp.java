package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.FileInputStream;

public final class search_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

   //getting the passing variable (team's name)
   String nameIn = request.getParameter("nameKey");
   
    //storing the file name into a String variable
    String fileName= "E:/CST 4713 - Dynamic Web Development/Homework 4/web/hwk4_superbowl.csv";
    
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
    
    
    
    
    


    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
