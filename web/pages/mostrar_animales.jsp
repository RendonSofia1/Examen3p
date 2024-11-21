<%-- 
    Document   : mostrar_animales
    Created on : 13-nov-2024, 19:15:09
    Author     : rendo
--%>

<%@page import="Model.Animale"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String mensaje = (String) request.getAttribute("mensaje");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Animales Registrados</title>
    </head>
    <body>
        <% if (mensaje != null) {%>
        <div id="alerta" class="alert alert-info alert-dismissible fade show" role="alert">
            <i class="bi bi-info-square-fill"></i>
            <%= mensaje%>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>

        <script>
            // Cierra automáticamente la alerta después de 3 segundos
            setTimeout(function () {
                var alerta = document.getElementById("alerta");
                if (alerta) {
                    alerta.classList.remove("show"); // Oculta la alerta visualmente
                }
            }, 3000);
        </script>
        <% }%>

        <div class="container" style="margin-top: 20px">
            <a class="btn btn-outline-secondary"  href="${pageContext.request.contextPath}/pages/form_animal.jsp"
               role="button" style="margin-bottom: 15px"><i class="bi bi-plus-circle-fill"></i> Agregar Paciente</a>


            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover" >

                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Animale> listaAnimales = (ArrayList<Animale>) request.getAttribute("animales");

                            if (listaAnimales != null && !listaAnimales.isEmpty()) {
                                for (Animale animal : listaAnimales) {
                        %>
                        <tr>
                            <td><%= animal.getId()%></td>
                            <td><%= animal.getNombre()%></td>
                            <td> 
                                <form action="${pageContext.request.contextPath}/pages/animal_bean.jsp" method="POST" >
                                    <input type="hidden" name="id" id="id"  value= "<%= animal.getId()%>" >
                                    <input type="hidden" name="nombre" id="nombre" value= "<%= animal.getNombre()%>" >
                                    <input type="hidden" name="especie" id="especie" value= "<%= animal.getEspecie()%>" >
                                    <input type="hidden" name="color" id="color" value= "<%= animal.getColor()%>" >
                                    <input type="hidden" name="peso" id="peso" value= "<%= animal.getPeso()%>" >
                                    <input type="hidden" id="diagnostico" name="diagnostico" value= "<%= animal.getDiagnostico()%> ">
                                    <input type="hidden" id="estado" name="estado" value= "<%= animal.getEstado()%>" >
                                    <button class="btn btn-outline-secondary" type="submit" >Ver Bean</button>
                                </form>
                                <form action="${pageContext.request.contextPath}/pages/xmlAnimal.jsp" method="POST">
                                    <input type="hidden" name="id" id="id"  value= "<%= animal.getId()%>" >
                                    <input type="hidden" name="nombre" id="nombre" value= "<%= animal.getNombre()%>" >
                                    <input type="hidden" name="especie" id="especie" value= "<%= animal.getEspecie()%>" >
                                    <input type="hidden" name="color" id="color" value= "<%= animal.getColor()%>" >
                                    <input type="hidden" name="peso" id="peso" value= "<%= animal.getPeso()%>" >
                                    <input type="hidden" id="diagnostico" name="diagnostico" value= "<%= animal.getDiagnostico()%> ">
                                    <input type="hidden" id="estado" name="estado" value= "<%= animal.getEstado()%>" >
                                    <button class="btn btn-outline-primary" type="submit">Ver XML</button>
                                </form>

                            </td>

                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="3 " class="text-center">No hay registros</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>  
        </div>

    </body>
</html>
