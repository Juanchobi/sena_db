<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historial de Revisiones - SENA</title>
    <style>
        :root { --sena-blue: #00324D; --sena-green: #39A900; }
        body { font-family: 'Segoe UI', sans-serif; background: #f4f4f4; padding: 20px; }
        .container-historial {
            background: white; padding: 30px; border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1); max-width: 1000px; margin: auto;
        }
        h2 { color: var(--sena-blue); text-align: center; border-bottom: 3px solid var(--sena-green); padding-bottom: 10px; }
        .tabla-tecnica { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .tabla-tecnica th { background: var(--sena-blue); color: white; padding: 12px; }
        .tabla-tecnica td { padding: 10px; border-bottom: 1px solid #ddd; text-align: center; }
        .tecnico-badge { color: var(--sena-green); font-weight: bold; text-transform: uppercase; }
        .btn-volver {
            display: inline-block; margin-top: 20px; padding: 10px 20px;
            background: var(--sena-blue); color: white; text-decoration: none; border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container-historial">
        <h2>📜 Historial de Registros Técnicos</h2>
        <table class="tabla-tecnica">
            <thead>
                <tr>
                    <th>Fecha Registro</th>
                    <th>Técnico Responsable</th>
                    <th>Equipo / Modelo</th>
                    <th>Placa Inventario</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty listaHistorico}">
                        <c:forEach var="h" items="${listaHistorico}">
                            <tr>
                                <td>${h.fechaCompra}</td>
                                <td><span class="tecnico-badge">Jua Bermudez / Jairo de la Portilla</span></td>
                                <td>${h.nombre}</td>
                                <td><strong>${h.placa_inventario}</strong></td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td colspan="4">No hay registros en la bitácora técnica.</td></tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        <a href="dashboard.jsp" class="btn-volver">⬅ Volver al Panel</a>
    </div>
</body>
</html>