package Controller;

import Model.Usuario;
import Model.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Validar extends HttpServlet {

    UsuarioDAO usdao=new UsuarioDAO();
    Usuario us=new Usuario();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion=request.getParameter("accion");
        if (accion.equalsIgnoreCase("Ingresar")) {
            String user=request.getParameter("txtuser");
            String pass=request.getParameter("txtpass");
            us=usdao.validar(user, pass);
            if (us.getUsername()!=null) {
                request.setAttribute("user", us);
                request.getRequestDispatcher("Controlador?menu=Principal").forward(request, response);
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
