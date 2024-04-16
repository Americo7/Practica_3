
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.Seminario"%>
<%
    Seminario seminario = (Seminario) request.getAttribute("seminario");
    if (seminario == null) {
        seminario = new Seminario();
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            padding: 20px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }
        input[type="text"],
        select,
        input[type="checkbox"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>


    <body>
        <h1>Editar Seminario</h1>
        <form action="MainServlet" method="post">
            <input type="hidden" name="id" value="<%= seminario.getId()%>">
            Fecha: <input type="text" name="fecha" value="<%= seminario.getFecha()%>"><br>
            Nombre: <input type="text" name="nombre" value="<%= seminario.getNombre()%>"><br>
            Apellido: <input type="text" name="apellido" value="<%= seminario.getApellido()%>"><br>
            Turno:
            <select name="turno">
                <option value="mañana" <%= seminario.getTurno().equals("mañana") ? "selected" : ""%>>Mañana</option>
                <option value="tarde" <%= seminario.getTurno().equals("Tarde") ? "selected" : ""%>>Tarde</option>
                <option value="noche" <%= seminario.getTurno().equals("Noche") ? "selected" : ""%>>Noche</option>
            </select><br>
            Seminarios:
            <input type="checkbox" name="seminarios" value="Inteligencia Artificial" <%= seminario.getSeminarios() != null && seminario.getSeminarios().contains("Inteligencia Artificial") ? "checked" : ""%>>Inteligencia Artificial
            <input type="checkbox" name="seminarios" value="Mochile Learning" <%= seminario.getSeminarios() != null && seminario.getSeminarios().contains("Mochile Learning") ? "checked" : ""%>>Mochile Learning
            <input type="checkbox" name="seminarios" value="Simulacion con arena" <%= seminario.getSeminarios() != null && seminario.getSeminarios().contains("Simulacion con arena") ? "checked" : ""%>>Simulacion con arena
            <input type="checkbox" name="seminarios" value="Robotica Educativa" <%= seminario.getSeminarios() != null && seminario.getSeminarios().contains("Robotica Educativa") ? "checked" : ""%>>Robotica Educativa<br>
            <input type="submit" value="Guardar">
        </form>
    </body>
</html>
