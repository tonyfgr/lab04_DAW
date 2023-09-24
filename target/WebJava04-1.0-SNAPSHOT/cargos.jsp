<%-- 
    Document   : areas
    Created on : 18/09/2023, 04:02:36 PM
    Author     : Tony
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

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
        <%-- Validación de sesión --%>
        <%
            HttpSession misession = (HttpSession) request.getSession();
            String usuario = (String) misession.getAttribute("usuario");
            if (misession == null || usuario == null) {
        %>
        <link rel="stylesheet" href="webjars/bootstrap/5.1.0/css/bootstrap.min.css" type="text/css" />
        <center>
            <h3>No tiene permisos para acceder a esta sección</h3>
            <a class="btn btn-primary" href="/WebJava04/login.jsp">Ir a página de acceso</a>
        </center>
        <%
            return;
        }
        %>

        <h3>Usuario Logeado: <b><%= usuario %></b></h3>
        <h3><a class="btn btn-danger" href="/WebJava04/ServletSesion">Cerrar Sesión</a></h3>

        <h1>Listado de Cargos</h1>
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
                    <th scope="col">CÓDIGO</th>
                    <th scope="col">NOMBRE</th>
                    <th scope="col">CARGO</th>
                    <th scope="col">ESTADO</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String driver = "com.mysql.cj.jdbc.Driver";
                    String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC";
                    String user = "root";
                    String pass = "123456";

                    Class.forName(driver);
                    Connection xcon = DriverManager.getConnection(url, user, pass);

                    String sql = "SELECT * FROM cargos";
                    Statement stm = xcon.createStatement();
                    ResultSet rs = stm.executeQuery(sql);

                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                </tr>
                <%
                    }
                    rs.close();
                    stm.close();
                    xcon.close();
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
