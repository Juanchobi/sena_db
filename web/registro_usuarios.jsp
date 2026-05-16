<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Seguridad: Solo el admin puede estar aquí
    if (session.getAttribute("rolUsuario") == null || !session.getAttribute("rolUsuario").equals("admin")) {
        response.sendRedirect("principal.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SENA - Creación de Usuario</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --sena-blue: #00324D; --sena-green: #39A900; }
        body { font-family: 'Segoe UI', sans-serif; background: #f4f7f9; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
        .form-container { background: white; padding: 40px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); width: 100%; max-width: 500px; border-top: 10px solid var(--sena-blue); }
        h2 { color: var(--sena-blue); text-align: center; margin-bottom: 30px; }
        .input-group { margin-bottom: 15px; }
        .input-group label { display: block; color: #555; margin-bottom: 5px; font-weight: bold; }
        .input-group input, .input-group select { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 8px; box-sizing: border-box; }
        .btn-submit { background: var(--sena-green); color: white; border: none; width: 100%; padding: 15px; border-radius: 8px; font-size: 1.1rem; font-weight: bold; cursor: pointer; transition: 0.3s; }
        .btn-submit:hover { background: var(--sena-blue); }
        .back { display: block; text-align: center; margin-top: 15px; text-decoration: none; color: #888; }
    </style>
</head>
<body>

    <div class="form-container">
        <h2><i class="fa-solid fa-user-plus"></i> Nuevo Usuario</h2>
        
        <form action="UsuarioServlet?accion=registrar" method="POST">
            
            <div class="input-group">
                <label>Nombre Completo</label>
                <input type="text" name="nombre" required>
            </div>

            <div style="display: flex; gap: 10px;">
                <div class="input-group" style="flex: 1;">
                    <label>Cédula</label>
                    <input type="number" name="cedula" required>
                </div>
                <div class="input-group" style="flex: 1;">
                    <label>Código Empleado</label>
                    <input type="text" name="codigo_empleado" required>
                </div>
            </div>

            <div class="input-group">
                <label>Correo Institucional</label>
                <input type="email" name="correo" required>
            </div>

            <div class="input-group">
                <label>Cargo</label>
                <input type="text" name="cargo" placeholder="Ej: Técnico Senior" required>
            </div>

            <div class="input-group">
                <label>Rol del Sistema</label>
                <select name="rol" required>
                    <option value="usuario">Usuario (Ver Tickets)</option>
                    <option value="tecnico">Técnico (Operaciones)</option>
                    <option value="admin">Administrador (Control Total)</option>
                </select>
            </div>

            <hr style="margin: 20px 0; border: 0; border-top: 1px solid #eee;">

            <div class="input-group">
                <label>Username (Login)</label>
                <input type="text" name="username" required>
            </div>

            <div class="input-group">
                <label>Password Inicial</label>
                <input type="password" name="password" required>
            </div>

            <button type="submit" class="btn-submit">CREAR CUENTA</button>
        </form>

        <a href="principal.jsp" class="back">← Volver al Menú</a>
    </div>

</body>
</html>