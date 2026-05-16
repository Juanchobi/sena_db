<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombre = (String) session.getAttribute("nombreUsuario");
    String rol = (String) session.getAttribute("rolUsuario");

    if (nombre == null) { response.sendRedirect("index.jsp"); return; }
    if (rol == null) { rol = "usuario"; } 
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>SENA - Panel de Operaciones</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --sena-blue: #00324D; --sena-green: #39A900; --bg: #F4F7F6; }
        body { font-family: 'Segoe UI', sans-serif; background: var(--bg); margin: 0; }
        .top-bar { background: white; padding: 15px 40px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .grid { max-width: 1000px; margin: 20px auto 40px auto; display: grid; grid-template-columns: repeat(2, 1fr); gap: 25px; padding: 20px; }
        .card { background: white; padding: 40px; border-radius: 15px; text-align: center; text-decoration: none; color: var(--sena-blue); border-bottom: 5px solid var(--sena-green); transition: 0.3s; }
        .card:hover { background: var(--sena-blue); color: white; transform: translateY(-5px); }
        .card i { font-size: 3.5rem; margin-bottom: 20px; display: block; }
        .card span { font-weight: bold; text-transform: uppercase; }

        /* --- ESTILOS LOGO 3D --- */
        .sena-logo-container {
            perspective: 1000px;
            text-align: center;
            margin-top: 30px;
        }
        .sena-logo { 
            width: 100px; 
            animation: rotacion3D 7s linear infinite;
            transform-style: preserve-3d;
            filter: drop-shadow(0 5px 15px rgba(0,0,0,0.1));
        }
        @keyframes rotacion3D {
            from { transform: rotateY(0deg); }
            to { transform: rotateY(360deg); }
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <h2 style="margin:0; font-size:1.2rem; color:var(--sena-blue);">SISTEMA DE GESTIÓN</h2>
        <div>
            <span>Bienvenido, <b><%= nombre %></b> (<%= rol.toUpperCase() %>)</span>
            <a href="index.jsp" style="margin-left:15px; color:red; text-decoration:none; font-weight:bold;">SALIR</a>
        </div>
    </div>

    <div class="sena-logo-container">
        <img src="img/logo_sena.png" class="sena-logo" alt="SENA">
    </div>

    <div class="grid">
        <%-- LÓGICA DE ROLES EXISTENTE --%>
        <% if (rol.equals("admin") || rol.equals("tecnico")) { %>
            <a href="EquipoServlet?accion=listar" class="card">
                <i class="fa-solid fa-laptop-code"></i><span>GESTIONAR INVENTARIO</span>
            </a>
        <% } %>

        <% if (rol.equals("admin")) { %>
            <a href="registro_detalle.jsp" class="card">
                <i class="fa-solid fa-plus-circle"></i><span>INGRESAR EQUIPO</span>
            </a>
        <% } %>

        <a href="solicitar_soporte.jsp" class="card">
            <i class="fa-solid fa-ticket-alt"></i><span>CREAR TICKET</span>
        </a>

        <a href="ver_tickets.jsp" class="card">
            <i class="fa-solid fa-list-check"></i><span>ESTADO DE SOLICITUDES</span>
        </a>

        <%-- 2. NUEVO BOTÓN: GESTIONAR USUARIOS (SOLO ADMIN) --%>
        <% if (rol.equals("admin")) { %>
            <a href="crear_usuario.jsp" class="card" style="border-bottom-color: var(--sena-blue);">
                <i class="fa-solid fa-users-gear"></i><span>GESTIONAR USUARIOS</span>
            </a>
        <% } %>
    </div>
</body>
</html>