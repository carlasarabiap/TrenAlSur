package Model;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Usuario validar(String username, String password) {
        Usuario us=new Usuario();
        String sql="select * from usuarios where username=? and password=?";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,password);
            rs=ps.executeQuery();
            while (rs.next()) {                
                us.setId(rs.getInt("id"));
                us.setUsername(rs.getString("username"));
                us.setPassword(rs.getString("password"));
                us.setNombre(rs.getString("nombre"));
                us.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
        }
        return us;
    }
    
    //Operaciones CRUD
    
    public List listar(){
        String sql="select * from usuarios";
        List<Usuario>lista=new ArrayList<>();
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {                
                Usuario us=new Usuario();
                us.setId(rs.getInt(1));
                us.setNombre(rs.getString(2));
                us.setApellido(rs.getNString(3));
                us.setEmail(rs.getString(4));
                us.setUsername(rs.getNString(5));
                us.setPassword(rs.getString(6));
                us.setFechaNac(rs.getString(7));
                us.setPais(rs.getString(8));
                lista.add(us);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    public int agregar(Usuario us){
        String sql="insert into usuarios(nombre, apellido, email, username, password, fechaNac, pais) values(?,?,?,?,?,?,?)";
            try {
                con=cn.Conexion();
                ps=con.prepareStatement(sql);
                ps.setString(1, us.getNombre());
                ps.setString(2, us.getApellido());
                ps.setString(3, us.getEmail());
                ps.setString(4, us.getUsername());
                ps.setString(5, us.getPassword());
                ps.setString(6, us.getFechaNac());
                ps.setString(7, us.getPais());
                ps.executeUpdate();
                // Generar JSON después de agregar
                List<Usuario> usuarios = this.listar();
                generarJson(usuarios);
            } catch (Exception e) {
               
            }
            return r;
    }
    public Usuario listarId(int id){
        Usuario us=new Usuario();
        String sql="select * from usuarios where id="+id;
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                us.setNombre(rs.getString(2));
                us.setApellido(rs.getNString(3));
                us.setEmail(rs.getString(4));
                us.setUsername(rs.getNString(5));
                us.setPassword(rs.getString(6));
                us.setFechaNac(rs.getString(7));
                us.setPais(rs.getString(8));
            }
        } catch (Exception e) {
        }
        return us;
    }
    
    public int actualizar(Usuario us){
        String sql="update usuarios set nombre=?, apellido=?, email=?, username=?, password=?, fechaNac=?, pais=? where id=?";
            try {
                con=cn.Conexion();
                ps=con.prepareStatement(sql);
                ps.setString(1, us.getNombre());
                ps.setString(2, us.getApellido());
                ps.setString(3, us.getEmail());
                ps.setString(4, us.getUsername());
                ps.setString(5, us.getPassword());
                ps.setString(6, us.getFechaNac());
                ps.setString(7, us.getPais());
                ps.setInt(8, us.getId());
                ps.executeUpdate();
                
                // Generar JSON después de actualizar
                List<Usuario> usuarios = this.listar();
                generarJson(usuarios);
            } catch (Exception e) {
               
            }
            return r;
    }
    
    public void delete(int id){
        String sql="delete from usuarios where Id="+id;
            try {
                con=cn.Conexion();
                ps=con.prepareStatement(sql);
                ps.executeUpdate();
            // Generar JSON después de eliminar
            List<Usuario> usuarios = this.listar();
            generarJson(usuarios);
            } catch (Exception e) {
            }
    }
    
    private void generarJson(List<Usuario> usuarios) throws IOException {
        File file = new File("C:\\Users\\Microsoft\\Documents\\Programacion\\CaC\\proyecto\\TrenAlSur\\usuarios.json"); // Especifica la ruta completa
        FileWriter writer = new FileWriter(file); // Sobrescribe el archivo si existe
        
        StringBuilder sb = new StringBuilder();
        sb.append("[\n");
        for (Usuario usuario : usuarios) {
            sb.append("{\n");
            sb.append("\"id\": ").append(usuario.getId()).append(",\n");
            sb.append("\"nombre\": \"").append(usuario.getNombre()).append("\",\n");
            sb.append("\"apellido\": \"").append(usuario.getApellido()).append("\",\n");
            sb.append("\"email\": \"").append(usuario.getEmail()).append("\",\n");
            sb.append("\"username\": \"").append(usuario.getUsername()).append("\",\n");
            sb.append("\"password\": \"").append(usuario.getPassword()).append("\",\n");
            sb.append("\"fechaNac\": \"").append(usuario.getFechaNac()).append("\",\n");
            sb.append("\"pais\": \"").append(usuario.getPais()).append("\"\n");
            sb.append("},\n");
        }
        sb.setLength(sb.length() - 2);
        sb.append("\n]\n");
        
        writer.write(sb.toString());
        writer.flush();
        writer.close();
    }
}



