<%-- 
    Document   : animal_bean
    Created on : 13-nov-2024, 20:16:47
    Author     : rendo
--%>
<%
    response.setContentType("text/html; charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="animalBean" scope="page" class="Model.Animale"/>
<jsp:setProperty name="animalBean" property="*"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container mt-4 p-4">
            <h3 class="mb-3">Detalles del paciente:</h3>
            <div>
                <ol class="list-group list-group">
                    <li class="list-group-item">
                        <b>ID:</b> <%= animalBean.getId() %>
                    </li>
                    <li class="list-group-item">
                        <b>Nombre:</b> <%= animalBean.getNombre() %>
                    </li>
                    <li class="list-group-item">
                        <b>Especie:</b> <%= animalBean.getEspecie() %>
                    </li>
                    <li class="list-group-item">
                        <b>Color:</b> <%= animalBean.getColor() %>
                    </li>
                    <li class="list-group-item">
                        <b>Peso:</b> <%= animalBean.getPeso() %>
                    </li>
                    <li class="list-group-item">
                        <b>Diagnostico:</b> <%= animalBean.getDiagnostico() %>
                    </li>
                    <li class="list-group-item">
                        <b>Estado:</b> <%= animalBean.getEstado() %>
                    </li>
                </ol>

                <a class="btn btn-warning mt-3" href="${pageContext.request.contextPath}/animaleServlet">Regresar</a>
            </div>
        </div>
    </body>
</html>
