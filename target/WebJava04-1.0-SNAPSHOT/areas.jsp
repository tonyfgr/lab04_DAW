<%-- 
    Document   : areas
    Created on : 18/09/2023, 04:02:36 PM
    Author     : Tony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

    <%--validacion de sesion--%>
<%
HttpSession misession= (HttpSession) request.getSession();
String usuario= (String) misession.getAttribute("usuario");  
if(misession == null || misession.getAttribute("usuario") == null){
      out.print("<link rel=\"stylesheet\" \n"
                + "              href=\"webjars/bootstrap/5.1.0/css/bootstrap.min.css\" type=\"text/css\" />");
      out.println("<center>");           
      out.println("<h3>No tiene permisos para acceder a esta seccion</h3>");
      out.println("<a class='btn btn-primary' href='/WebJava04/login.jsp'>Ir a pagina de acceso</a>");
      out.println("</center>");
      return;
  }    
%>

<%
  String driver = "com.mysql.cj.jdbc.Driver";
  String url   = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC";
  String user   = "root";
  String pass   = "123456";
  
  Class.forName(driver);
  Connection xcon = DriverManager.getConnection(url, user, pass);
  
  String sql = "select * from areas";
  Statement stm = xcon.createStatement();
  ResultSet rs = stm.executeQuery(sql);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="webjars/bootstrap/5.1.0/css/bootstrap.min.css" type="text/css" />
    <title>JSP Page</title>
    <script>
        function cambiarColores() {
            var colorFilaPar = document.getElementById("colorFilaPar").value;
            var colorFilaImpar = document.getElementById("colorFilaImpar").value;

            var filas = document.querySelectorAll("tbody tr");
            for (var i = 0; i < filas.length; i++) {
                if (i % 2 === 0) {
                    filas[i].style.backgroundColor = colorFilaPar;
                } else {
                    filas[i].style.backgroundColor = colorFilaImpar;
                }
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h3>Usuario Logeado: <b><% out.print(usuario); %></b></h3>
        <h3><a class='btn btn-danger' href="/WebJava04/ServletSesion">Cerrar Sesion</a></h3>

        <h1>Listado de Areas</h1>

        <form>
            <div class="mb-3">
                <label for="colorFilaPar" class="form-label">Color de fondo para filas impares:</label>
                <input type="color" id="colorFilaPar" class="form-control">
            </div>
            <div class="mb-3">
                <label for="colorFilaImpar" class="form-label">Color de fondo para filas pares:</label>
                <input type="color" id="colorFilaImpar" class="form-control">
            </div>
            <button type="button" class="btn btn-primary" onclick="cambiarColores()">Cambiar Colores</button>
        </form>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">CODIGO</th>
                    <th scope="col">NOMBRE</th>
                    <th scope="col">ESTADO</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                        out.print("<tr>");
                        out.print("<td>" + rs.getString(1) + "</td>");
                        out.print("<td>" + rs.getString(2) + "</td>");
                        out.print("<td>" + rs.getString(3) + "</td>");
                        out.print("</tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>

