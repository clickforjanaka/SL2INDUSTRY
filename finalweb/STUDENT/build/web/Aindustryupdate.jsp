<%-- 
    Document   : Aindustryupdate
    Created on : Apr 7, 2019, 10:35:41 PM
    Author     : HP
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "university";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="bootstrap.html"/>
        <script src="swal/dist/sweetalert-dev.js"></script>
    </head>
    <body style="background-color:#b4e7ea">
        <br>
         <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h2 class="section-heading">Update Industry Password</h2>
                        <hr class="light">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6 col-md-6 text-center" >
                        <form action="#" method="POST"> 
                            <input type="text" class="form-control" name="nm" placeholder="User ID" required=""/><br>
                            <input type="text" class="form-control" name="ps" placeholder="Password" required=""/><br>
                            <button class="btn btn-xl btn-danger sr-button" name="Update" type="submit">Update</button><br>
                        </form>
                    </div>
                </div>
            </div>

        <%
            con = DriverManager.getConnection(connectionUrl+database, userid, password);
        String uid = request.getParameter("nm");
String paw = request.getParameter("ps");
int i = 0;

String sql ="UPDATE industry SET pass=? WHERE userid=?";

try {
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, paw);
    ps.setString(2, uid);
    i = ps.executeUpdate();
} catch (SQLException e) {
    e.printStackTrace();
}
        %>
    </body>
</html>