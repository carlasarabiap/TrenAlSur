
package Controller;


import Model.Usuario;
import Model.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class Controlador extends HttpServlet {
    
    Usuario us=new Usuario();
    UsuarioDAO udao=new UsuarioDAO();
    int ide;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String menu=request.getParameter("menu");
        String accion=request.getParameter("accion");
        if (menu.equals("Principal")) {
            request.getRequestDispatcher("principal.jsp").forward(request, response);
        }
        if (menu.equals("Usuario")) {
            switch (accion) {
                case "Listar":
                    List lista=udao.listar();
                    request.setAttribute("user1", lista);
                    break;
                    
                case "Agregar":
                    String nombre=request.getParameter("txtNombre");
                    String apellido=request.getParameter("txtApellido");
                    String email=request.getParameter("txtEmail");
                    String username=request.getParameter("txtUsername");
                    String password=request.getParameter("txtPassword");
                    String fechaNac=request.getParameter("txtFechaNac");
                    String pais=request.getParameter("txtPais");
                    us.setNombre(nombre);
                    us.setApellido(apellido);
                    us.setEmail(email);
                    us.setUsername(username);
                    us.setPassword(password);
                    us.setFechaNac(fechaNac);
                    us.setPais(pais);
                    udao.agregar(us);
                    request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                    break;
                    
                case "Editar":
                    ide=Integer.parseInt(request.getParameter("id"));
                    Usuario usEditar=udao.listarId(ide);
                    request.setAttribute("usuario", usEditar);
                    request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                    break;
                    
                case "Actualizar":
                    String nombreActualizar=request.getParameter("txtNombre");
                    String apellidoActualizar=request.getParameter("txtApellido");
                    String emailActualizar=request.getParameter("txtEmail");
                    String usernameActualizar=request.getParameter("txtUsername");
                    String passwordActualizar=request.getParameter("txtPassword");
                    String fechaNacActualizar=request.getParameter("txtFechaNac");
                    String paisActualizar=request.getParameter("txtPais");
                    us.setNombre(nombreActualizar);
                    us.setApellido(apellidoActualizar);
                    us.setEmail(emailActualizar);
                    us.setUsername(usernameActualizar);
                    us.setPassword(passwordActualizar);
                    us.setFechaNac(fechaNacActualizar);
                    us.setPais(paisActualizar);
                    us.setId(ide);
                    udao.actualizar(us);
                    request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                    break;
                case "Delete":
                    ide=Integer.parseInt(request.getParameter("id"));
                    udao.delete(ide);
                    request.getRequestDispatcher("Controlador?menu=Usuario&accion=Listar").forward(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("usuario.jsp").forward(request, response);
        }
        if (menu.equals("Estaciones")) {
            request.getRequestDispatcher("Html/estaciones.html").forward(request, response);
        }
        if (menu.equals("Pasajes")) {
            request.getRequestDispatcher("Html/pasajes.html").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
