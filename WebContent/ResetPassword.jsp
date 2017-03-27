<%@ 
page import ="java.sql.*"  language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" import="java.io.*,java.util.*" %>
<%
try{
    String username = request.getParameter("username");   
    String email = request.getParameter("email");
    out.println("grabbed values");
    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys" , "root", "Pwtemp01!");    
    PreparedStatement pst = conn.prepareStatement("Select username,email from sys.users where username='?' and email='?'");
    PreparedStatement account = conn.prepareStatement("Select * from users where username='?' and email='?'");
    pst.setString(1, username);
    pst.setString(2, email);
    out.println(pst);
    account.setString(1, username);
    account.setString(2, email);
    out.println(pst);
    ResultSet rs = pst.executeQuery();                        
    if(rs.next()) { 
    	//session.setAttribute("logged_in", "yes");
    	out.println("in the if");
    	rs = account.executeQuery();
    	rs.next();
    	
    	Random r = new Random(); // perhaps make it a class variable so you don't make a new one every time
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < 10; i++) {
            char c = (char)(r.nextInt((int)(Character.MAX_VALUE)));
            sb.append(c);
        }
        String newPassword = sb.toString();
    	classes.sendMail.send("PASSWORD RESET", "newpassword", email);
    	out.println("emailing password");
    	PreparedStatement passUpdate = conn.prepareStatement("UPDATE `sys`.`users` SET `password`='?' WHERE `username`='?'");
    	passUpdate.setString(1, newPassword);
    	passUpdate.setString(2, username);
    	//session.setAttribute("Username", rs.getNString("username"));
    	//session.setAttribute("First_Name", rs.getNString("firstname"));
    	//session.setAttribute("Last_Name", rs.getNString("lastname"));
    	//session.setAttribute("Email", rs.getNString("email"));
    	//session.setAttribute("Account_Type", rs.getNString("acc_type"));
       String site = new String("http://localhost:8080/Airline/Login.jsp");
       response.sendRedirect(site);
    }        	
    else{
    	String site = new String("http://localhost:8080/Airline/ResetPasswordPage.jsp");
		out.println("Invalid login credentials - redirecting to hompeage"); 
		response.sendRedirect(site);
    }
} catch (Exception e){
	
}
%>