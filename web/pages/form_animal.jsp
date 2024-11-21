<%-- 
    Document   : formEstudiante
    Created on : 14-oct-2024, 21:32:18
    Author     : rendo
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro de Paciente</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }
            .form-container {
                padding: 20px;
                display: flex;
                flex-direction: column ;
                width: 400px;
                margin: 0 auto;
                background: #fff;

                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                color: #333;
            }
            label {
                display: block;
                margin: 10px 0 5px;
                color: #555;
            }
            input[type="text"],
            input[type="number"],
            input[type="datetime-local"],
            select {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #28a745;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
            }
            input[type="submit"]:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1>Registro de Paciente</h1>
            <form method="post" action="${pageContext.request.contextPath}/animaleServlet">
                <label for="id">ID:</label>
                <input type="number" name="id" id="id" required>

                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" id="nombre" required pattern="^[a-zA-Z0-9]+$" title="No se permiten espacios ni caracteres especiales">


                <label for="especie">Especie:</label>
                <input type="text" name="especie" id="especie" required>

                <label for="color">Color:</label>
                <input type="text" name="color" id="color" required>

                <label for="peso">Peso (Kg):</label>
                <input type="number" step="0.01" name="peso" id="peso" required>

                <label for="diagnostico">Diagnóstico:</label>
                <input type="text" id="diagnostico" name="diagnostico" required>

                <label for="estado">Estado:</label>
                <select id="estado" name="estado" required>
                    <option value="Saludable">Saludable</option>
                    <option value="Enfermo">Enfermo</option>
                    <option value="En observación">En observación</option>
                </select>

                <input type="submit" value="Confirmar">
            </form>
        </div>
    </body>
</html>
