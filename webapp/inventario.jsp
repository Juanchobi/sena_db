<%-- 
    Archivo: inventario.jsp
    Proyecto: Sistema de Gestión de Mantenimiento de Equipos - SENA
    Descripción: Lista técnica de equipos con monitoreo de estado de energía.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Inventario Técnico - SENA</title>
    <style>
        :root { --sena-green: #39A900; --sena-blue: #00324D; }
        body { font-family: 'Segoe UI', sans-serif; background-color: #f4f4f4; padding: 20px; }
        .card { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        h2 { color: var(--sena-blue); border-left: 5px solid var(--sena-green); padding-left: 10px; }
        
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th { background-color: var(--sena-blue); color: white; padding: 12px; text-align: left; }
        td { padding: 12px; border-bottom: 1px solid #ddd; }
        tr:hover { background-color: #f9f9f9; }

        /* Estilos para el estado de energía */
        .status-dot { height: 10px; width: 10px; border-radius: 50%; display: inline-block; margin-right: 5px; }
        .online { background-color: #2ecc71; color: #2ecc71; font-weight: bold; } /* Verde */
        .offline { background-color: #e74c3c; color: #e74c3c; font-weight: bold; } /* Rojo */
        
        .btn-delete { color: #e74c3c; text-decoration: none; font-weight: bold; border: 1px solid #e74c3c; padding: 5px 10px; border-radius: 4px; }
        .btn-delete:hover { background: #e74c3c; color: white; }
        .btn-back { display: inline-block; margin-bottom: 20px; text-decoration: none; color: var(--sena-blue); font-weight: bold; }
    </style>
</head>
<body>

<div class="card">
    <a href="principal.jsp" class="btn-back">⬅ Volver al Dashboard</a>
    <h2>📦 Equipos en Inventario - Control de Sede</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Dispositivo</th>
                <th>Marca / Modelo</th>
                <th>Serial</th>
                <th>Estado Energía</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="equipo" items="${listaEquipos}">
                <tr>
                    <td>${equipo.id}</td>
                    <td><strong>${equipo.nombre}</strong></td>
                    <td>${equipo.marca} ${equipo.modelo}</td>
                    <td><code>${equipo.serial}</code></td>
                    <td>
                        <span class="status-dot ${equipo.energia == 'Encendido' ? 'online' : 'offline'}"></span>
                        <span class="${equipo.energia == 'Encendido' ? 'online' : 'offline'}">
                            ${equipo.energia}
                        </span>
                    </td>
                    <td>
                        <a href="EquipoServlet?action=delete&id=${equipo.id}" 
                           class="btn-delete" 
                           onclick="return confirm('¿Seguro que desea eliminar este equipo del inventario SENA?')">
                           Eliminar
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>