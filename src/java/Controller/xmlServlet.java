/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 *
 * @author rendo
 */
@WebServlet(name = "xmlServlet", urlPatterns = {"/xmlServlet"})
public class xmlServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet xmlServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet xmlServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Leer los datos del formulario
        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String especie = request.getParameter("especie");
        String color = request.getParameter("color");
        String peso = request.getParameter("peso");
        String diagnostico = request.getParameter("diagnostico");
        String estado = request.getParameter("estado");

        try {
            // Crear el documento XML
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.newDocument();

            // Raíz del XML
            Element root = document.createElement("Animal");
            document.appendChild(root);

            // Crear los elementos XML a partir de los datos del formulario
            Element idElement = document.createElement("Id");
            idElement.appendChild(document.createTextNode(id));
            root.appendChild(idElement);

            Element nombreElement = document.createElement("Nombre");
            nombreElement.appendChild(document.createTextNode(nombre));
            root.appendChild(nombreElement);

            Element especieElement = document.createElement("Especie");
            especieElement.appendChild(document.createTextNode(especie));
            root.appendChild(especieElement);

            Element colorElement = document.createElement("Color");
            colorElement.appendChild(document.createTextNode(color));
            root.appendChild(colorElement);

            Element pesoElement = document.createElement("Peso");
            pesoElement.appendChild(document.createTextNode(peso));
            root.appendChild(pesoElement);

            Element diagnosticoElement = document.createElement("Diagnostico");
            diagnosticoElement.appendChild(document.createTextNode(diagnostico));
            root.appendChild(diagnosticoElement);

            Element estadoElement = document.createElement("Estado");
            estadoElement.appendChild(document.createTextNode(estado));
            root.appendChild(estadoElement);

            // Preparar la respuesta para la descarga del archivo XML
            response.setContentType("application/xml");
            String fileName = id.replace(" ", "") + "_" + nombre.replace(" ", "") + ".xml";
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

            // Convertir el documento a un flujo de salida y enviarlo en la respuesta
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(document);
            StreamResult result = new StreamResult(response.getOutputStream());

            // Realizar la transformación y enviar el archivo XML como descarga
            transformer.transform(source, result);

        } catch (ParserConfigurationException | TransformerException e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al crear XML");
            request.getRequestDispatcher("/jsp/procesarC.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
