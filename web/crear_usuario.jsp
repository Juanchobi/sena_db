<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Registro de Usuarios</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background-color: #f4f7f6; padding: 20px; }
        .container { background: white; max-width: 500px; margin: auto; padding: 30px; border-radius: 15px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        h2 { color: #00324D; text-align: center; border-bottom: 2px solid #39A900; padding-bottom: 10px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; color: #555; }
        input, select { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 8px; box-sizing: border-box; }
        button { width: 100%; padding: 12px; background: #39A900; color: white; border: none; border-radius: 8px; cursor: pointer; font-weight: bold; margin-top: 10px; }
        button:hover { background: #00324D; }
        .msg-exito { background: #d4edda; color: #155724; padding: 10px; border-radius: 8px; margin-bottom: 15px; text-align: center; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registrar Nuevo Usuario</h2>

        <%-- Mensaje de confirmación --%>
        <% if(session.getAttribute("mensaje") != null) { %>
            <div class="msg-exito"><%= session.getAttribute("mensaje") %></div>
            <% session.removeAttribute("mensaje"); %>
        <% } %>

        <form action="UsuarioServlet" method="POST">
            <input type="hidden" name="accion" value="registrar">
            
            <div class="form-group">
                <label>Nombre Completo</label>
                <input type="text" name="nombre" required>
            </div>
            <div class="form-group">
                <label>Cédula</label>
                <input type="text" name="cedula" required>
            </div>
            <div class="form-group">
                <label>Código de Empleado</label>
                <input type="text" name="codigo_empleado" required>
            </div>
            <div class="form-group">
                <label>Correo Electrónico</label>
                <input type="email" name="correo" required>
            </div>
            <div class="form-group">
                <label>Cargo</label>
                <input type="text" name="cargo" required>
            </div>
            <div class="form-group">
                <label>Nombre de Usuario (Login)</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>Contraseña</label>
                <input type="password" name="password" required>
            </div>
            <div class="form-group">
                <label>Rol del Usuario</label>
                <select name="rol">
                    <option value="usuario">Usuario / Cliente</option>
                    <option value="tecnico">Técnico de Soporte</option>
                    <option value="admin">Administrador</option>
                </select>
            </div>
            
            <button type="submit">GUARDAR USUARIO</button>
            <a href="principal.jsp" style="display:block; text-align:center; margin-top:15px; color:#00324D; text-decoration:none;">Volver al Panel</a>
        </form>
    </div>
</body>
</html>