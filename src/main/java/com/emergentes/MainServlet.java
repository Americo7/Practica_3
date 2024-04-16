package com.emergentes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null
                ? request.getParameter("action") : "view";
        switch (action) {
            case "view":
                response.sendRedirect("index.jsp");
                break;
            case "nuevo":
                Seminario seminario = new Seminario();
                request.setAttribute("seminario", seminario);
                request.getRequestDispatcher("edit.jsp").forward(request, response);
                break;
            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id").trim());
                HttpSession session = request.getSession();
                List<Seminario> lista = (ArrayList<Seminario>) session.getAttribute("lista");
                Seminario editSeminario = null;
                for (Seminario s : lista) {
                    if (s.getId() == idEditar) {
                        editSeminario = s;
                        break;
                    }
                }
                if (editSeminario != null) {
                    request.setAttribute("seminario", editSeminario);
                    
                    request.getRequestDispatcher("edit.jsp").forward(request, response);
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id").trim());
                HttpSession session1 = request.getSession();
                List<Seminario> lista1 = (ArrayList<Seminario>) session1.getAttribute("lista");
                for (Seminario s : lista1) {
                    if (s.getId() == idEliminar) {
                        lista1.remove(s);
                        break;
                    }
                }
                response.sendRedirect("index.jsp");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id").trim());
        String fecha = request.getParameter("fecha");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String turno = request.getParameter("turno");
        String[] seminarios = request.getParameterValues("seminarios");
        
        Seminario seminario = new Seminario();
        seminario.setId(id);
        seminario.setFecha(fecha);
        seminario.setNombre(nombre);
        seminario.setApellido(apellido);
        seminario.setTurno(turno);
        if (seminarios != null) {
        seminario.setSeminarios(Arrays.asList(seminarios));
    }

        HttpSession session = request.getSession();
        List<Seminario> lista = (ArrayList<Seminario>) session.getAttribute("lista");
        if (lista == null) {
            lista = new ArrayList<>();
            session.setAttribute("lista", lista);
        }
        if (id == 0) {
            int idNuevo = obtenerNuevoId(lista);
            seminario.setId(idNuevo);
            lista.add(seminario);
        } else {
            for (Seminario s : lista) {
                if (s.getId() == id) {
                    s.setFecha(fecha);
                    s.setNombre(nombre);
                    s.setApellido(apellido);
                    s.setTurno(turno);
                    if (seminarios != null) {
                       s.setSeminarios(Arrays.asList(seminarios));
                    } else {
                        s.setSeminarios(null);
                    }
                    break;
                }
            }
        }
      
        response.sendRedirect("index.jsp");
    }

    private int obtenerNuevoId(List<Seminario> lista) {
        int nuevoId = 1;
        for (Seminario s : lista) {
            if (s.getId() >= nuevoId) {
                nuevoId = s.getId() + 1;
            }
        }
        return nuevoId;
    }
}

