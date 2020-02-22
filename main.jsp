<%@ page import = "java.io.* ,java.util.* ,java.sql.Connection ,java.sql.DriverManager ,java.sql.PreparedStatement ,java.sql.ResultSet ,java.sql.SQLException ,java.sql.Statement ,java.time.LocalDateTime ,java.time.format.DateTimeFormatter" %>
    
    <html>
 <head>
  <title>JSP 2.0 Example - Hello World<title/>
 </head>
 <body>

	<% 
		System.out.println(request.getParameter("value"));
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
		System.out.println(dateTime.format(formatter));
		String sql = "INSERT INTO Temperatura (T/H, Value, Date) VALUES(?, ?, ?)";
			Connection connection = null;
			try {			
				Class.forName("org.sqlite.JDBC");
	        	connection = DriverManager.getConnection("jdbc:sqlite:D:\\DB\\DBTempDate.db");
				PreparedStatement pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("")
				pstmt.setDouble(2, Double.parseDouble(request.getParameter("value")));
				pstmt.setString(3, dateTime.format(formatter));
				
				pstmt.executeUpdate();			        		        
				}
		    	catch(SQLException e){
		    	 	System.err.println(e.getMessage());
		    	 	throw e;
		    	}
		    	finally {         
				try {
					if(connection != null)
						connection.close();
				}
				catch(SQLException e) {          
					System.err.println(e); 
				}		
            }
	
	%>
 <body>
</html>
