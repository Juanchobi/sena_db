<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    // 1. Seguridad y captura de filtros
    String nombreUser = (String) session.getAttribute("nombreUsuario");
    String rolUser = (String) session.getAttribute("rolUsuario");
    if (nombreUser == null) { response.sendRedirect("index.jsp"); return; }

    String filtro = request.getParameter("filtro");
    if (filtro == null) { filtro = "Pendiente"; }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Casos</title>
    <style>
        :root { --sena-blue: #00324D; --sena-green: #39A900; }
        body { font-family: 'Segoe UI', sans-serif; background: #f4f7f6; padding: 30px; }
        .container { max-width: 1200px; margin: auto; background: white; padding: 25px; border-radius: 15px; box-shadow: 0 5px 25px rgba(0,0,0,0.1); }
        
        /* LOGO 3D ANIMADO */
        .logo-container { perspective: 1000px; text-align: center; margin-bottom: 10px; }
        .logo-3d { width: 85px; animation: rotateY 8s infinite linear; transform-style: preserve-3d; }
        @keyframes rotateY { from { transform: rotateY(0deg); } to { transform: rotateY(360deg); } }

        /* PESTAÑAS DE FILTRO */
        .tabs-container { display: flex; gap: 15px; justify-content: center; margin: 25px 0; }
        .tab-link { 
            padding: 12px 24px; color: white; text-decoration: none; border-radius: 10px; 
            font-weight: bold; font-size: 0.9rem; transition: all 0.3s ease; opacity: 0.6;
        }
        .tab-link.active { opacity: 1; transform: scale(1.1); box-shadow: 0 4px 15px rgba(0,0,0,0.2); border: 2px solid #fff; }
        .tab-link:hover { opacity: 1; }

        /* TABLA */
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th { background: var(--sena-blue); color: white; padding: 15px; font-size: 14px; text-transform: uppercase; }
        td { padding: 15px; border-bottom: 1px solid #eee; text-align: center; font-size: 14px; color: #333; }
        tr:hover { background: #fcfcfc; }

        .badge { padding: 6px 12px; border-radius: 20px; color: white; font-size: 11px; font-weight: bold; }
        .bg-red { background: #d9534f; }
        .bg-orange { background: #f0ad4e; }
        .bg-green { background: #5cb85c; }

        .alert { padding: 15px; border-radius: 10px; margin-bottom: 20px; text-align: center; font-weight: bold; }
        .alert-success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
    </style>
</head>
<body>

<div class="container">
    <div class="logo-container">
        <img src="img/logo_sena.png" class="logo-3d" alt="SENA">
    </div>

    <h2 style="text-align: center; color: var(--sena-blue); margin-top: 0;">Gestión de Casos Técnicos</h2>

    <%-- MENSAJES DE ALERTA --%>
    <% String msg = (String) session.getAttribute("alertaVerde");
       if (msg != null) { %>
        <div class="alert alert-success">✅ <%= msg %></div>
    <% session.removeAttribute("alertaVerde"); } %>

    <div class="tabs-container">
        <a href="ver_tickets.jsp?filtro=Pendiente" class="tab-link <%= filtro.equals("Pendiente") ? "active" : "" %>" style="background: #d9534f;">📥 DISPONIBLES</a>
        <a href="ver_tickets.jsp?filtro=En Proceso" class="tab-link <%= filtro.equals("En Proceso") ? "active" : "" %>" style="background: #f0ad4e;">🛠️ MI TRABAJO</a>
        <a href="ver_tickets.jsp?filtro=Cerrado" class="tab-link <%= filtro.equals("Cerrado") ? "active" : "" %>" style="background: #5cb85c;">✅ FINALIZADOS</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Usuario</th>
                <th>Falla</th>
                <th>Estado</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <%
                String url = "jdbc:mysql://localhost:3307/sena_db";
                try (Connection con = DriverManager.getConnection(url, "root", "")) {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    String sql;
                    if (filtro.equals("Pendiente")) {
                        sql = "SELECT * FROM tickets WHERE estado = 'Pendiente' ORDER BY id_ticket DESC";
                    } else {
                        sql = "SELECT * FROM tickets WHERE estado = ? AND tecnico_asignado = ? ORDER BY id_ticket DESC";
                    }
                    
                    PreparedStatement ps = con.prepareStatement(sql);
                    if (!filtro.equals("Pendiente")) {
                        ps.setString(1, filtro);
                        ps.setString(2, nombreUser);
                    }
                    
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()) {
                        String st = rs.getString("estado");
                        String color = st.equals("Pendiente") ? "bg-red" : (st.equals("En Proceso") ? "bg-orange" : "bg-green");
            %>
                <tr>
                    <td><strong>#<%= rs.getInt("id_ticket") %></strong></td>
                    <td><%= rs.getString("nombre_usuario") %></td>
                    <td><%= rs.getString("tipo_falla") %></td>
                    <td><span class="badge <%= color %>"><%= st %></span></td>
                    <td>
                        <% if(st.equals("Pendiente")) { %>
                            <a href="EquipoServlet?accion=asignar_tecnico&id=<%= rs.getInt("id_ticket") %>" 
                               style="background: var(--sena-green); color: white; padding: 8px 15px; border-radius: 6px; text-decoration: none; font-size: 12px; font-weight: bold;">
                               Tomar Caso
                            </a>
                        <% } else if(st.equals("En Proceso")) { %>
                            <form action="EquipoServlet" method="POST" style="display: flex; gap: 5px; justify-content: center;">
                                <input type="hidden" name="accion" value="cerrar_ticket">
                                <input type="hidden" name="id" value="<%= rs.getInt("id_ticket") %>">
                                <input type="text" name="solucion" placeholder="Resumen..." required style="padding: 6px; border: 1px solid #ccc; border-radius: 4px; font-size: 12px;">
                                <button type="submit" style="background: var(--sena-blue); color: white; border: none; padding: 6px 12px; border-radius: 4px; cursor: pointer; font-weight: bold;">FINALIZAR</button>
                            </form>
                        <% } else { %>
                            <span style="color: #5cb85c; font-weight: bold; font-size: 12px;">✔️ Completado</span>
                        <% } %>
                    </td>
                </tr>
            <% 
                    }
                } catch (Exception e) { out.print("Error: " + e.getMessage()); }
            %>
        </tbody>
    </table>

    <div style="margin-top: 30px; text-align: center;">
        <a href="EquipoServlet?accion=portal" style="color: var(--sena-blue); font-weight: bold; text-decoration: none; font-size: 14px;">⬅ Volver al Panel</a>
    </div>
</div>

</body>
</html>