


<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Seminario"%>
<%
    // Obtenemos la lista de seminarios de la sesión
    List<Seminario> lista = (ArrayList<Seminario>) session.getAttribute("lista");

    // Verificamos si la lista aún no ha sido inicializada
    if (lista == null) {
        // Solo la primera vez que se ejecuta la aplicación
        lista = new ArrayList<Seminario>();
        session.setAttribute("lista", lista); // Inicializamos la lista en la sesión
    }
%>
    



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        p {
            margin-bottom: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            color: #007bff;
            text-decoration: none;
            margin-right: 10px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
   <body>
    <h1>Registro de Seminarios</h1>
    
    <p>Estudiante: Rodrigo Americo De La Cruz</p>
    <p>C.I.: 13854969</p>

    <p><a href="MainServlet?action=nuevo">Nuevo</a></p>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Fecha</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Turno</th>
            <th>Seminarios Inscritos</th>
            <th>Editar</th>
            <th>Eliminar</th>
        </tr>
        <% for (Seminario seminario : lista) { %>
        <tr>
            <td><%= seminario.getId() %></td>
            <td><%= seminario.getFecha() %></td>
            <td><%= seminario.getNombre() %></td>
            <td><%= seminario.getApellido() %></td>
            <td><%= seminario.getTurno() %></td>
            <td><%= seminario.getSeminarios() != null ? seminario.getSeminarios().toString() : "" %></td>
            <td><a href="MainServlet?action=editar&id=<%= seminario.getId() %>">Editar</a></td>
            <td><a href="MainServlet?action=eliminar&id=<%= seminario.getId() %>">Eliminar</a></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
