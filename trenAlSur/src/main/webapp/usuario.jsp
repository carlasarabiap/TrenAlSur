<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="d-flex">
           <div class="card col-sm-3.5">
                <div class="card-body">
                    <form action="Controlador?menu=Usuario" method="POST">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" value="${usuario.getNombre()}" name="txtNombre" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Apellido</label>
                            <input type="text" value="${usuario.getApellido()}" name="txtApellido" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Fecha N</label>
                            <input type="text" value="${usuario.getFechaNac()}" name="txtFechaNac" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Pais</label>
                            <input type="text" value="${usuario.getPais()}" name="txtPais" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" value="${usuario.getEmail()}" name="txtEmail" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" value="${usuario.getUsername()}" name="txtUsername" class="form-control">
                        </div><div class="form-group">
                            <label>Password</label>
                            <input type="text" value="${usuario.getPassword()}" name="txtPassword" class="form-control">
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>APELLIDO</th>
                            <th>FECHA</th>
                            <th>PAIS</th>
                            <th>EMAIL</th>
                            <th>USERNAME</th>
                            <th>PASSWORD</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="us" items="${user1}">
                            <tr>
                                <td>${us.getId()}</td>
                                <td>${us.getNombre()}</td>
                                <td>${us.getApellido()}</td>
                                <td>${us.getFechaNac()}</td>
                                <td>${us.getPais()}</td>
                                <td>${us.getEmail()}</td>
                                <td>${us.getUsername()}</td>
                                <td>${us.getPassword()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Usuario&accion=Editar&id=${us.getId()}">Editar</a>
                                    <a class="btn btn-danger"  href="Controlador?menu=Usuario&accion=Delete&id=${us.getId()}">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div> 
        </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
