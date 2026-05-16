<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String nombre = (String) session.getAttribute("nombreUsuario");
    if (nombre == null) { response.sendRedirect("index.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SENA - Inventario de Activos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --sena-blue: #00324D; }
        body { background: #f4f7f6; font-family: 'Segoe UI', sans-serif; }
        .sena-header { background: var(--sena-blue); color: white; padding: 1.5rem; border-radius: 10px 10px 0 0; }
        .table-container { background: white; border-radius: 0 0 10px 10px; padding: 20px; box-shadow: 0 10px 25px rgba(0,0,0,0.05); }
        .btn-action { width: 34px; height: 34px; display: inline-flex; align-items: center; justify-content: center; border-radius: 6px; margin: 0 2px; color: white !important; transition: 0.2s; text-decoration: none; border: none; }
        .btn-action:hover { transform: scale(1.1); filter: brightness(90%); }
    </style>
</head>
<body class="p-4">

<div class="container">
    <div class="sena-header d-flex justify-content-between align-items-center">
        <div>
            <h2 class="mb-0 fw-bold">Inventario de Activos</h2>
            <small class="opacity-75">Técnico: <%= nombre %></small>
        </div>
        <div class="d-flex gap-2">
            <a href="dashboard.jsp" class="btn btn-outline-light btn-sm px-3"><i class="fa-solid fa-house me-1"></i> INICIO</a>
            <a href="EquipoServlet?accion=exportarPdf" class="btn btn-danger btn-sm px-3"><i class="fa-solid fa-file-pdf"></i> PDF</a>
            <a href="EquipoServlet?accion=csv" class="btn btn-light btn-sm px-3 text-dark"><i class="fa-solid fa-file-csv"></i> CSV</a>
            <a href="EquipoServlet?accion=nuevaFicha" class="btn btn-success btn-sm px-3 fw-bold"><i class="fa-solid fa-plus"></i> NUEVO</a>
        </div>
    </div>

    <div class="table-container">
        <table class="table table-hover align-middle mb-0 text-center">
            <thead class="table-light">
                <tr class="text-secondary small text-uppercase">
                    <th style="width: 15%">Placa</th>
                    <th style="width: 40%" class="text-start">Equipo / Detalle</th>
                    <th style="width: 15%">Estado</th>
                    <th style="width: 30%">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="e" items="${equipos}">
                    <c:if test="${not empty e.nombre}">
                        <tr>
                            <td><span class="badge bg-primary px-3 py-2">${e.placa_inventario}</span></td>
                            <td class="text-start">
                                <div class="fw-bold text-dark">${e.nombre}</div>
                                <div class="text-muted small">${e.marca} - ${e.modelo}</div>
                            </td>
                            <td>
                                <span class="badge ${e.estado_energia == 'encendido' ? 'bg-success' : 'bg-danger'} px-3">
                                    ${e.estado_energia.toUpperCase()}
                                </span>
                            <td>
    <a href="EquipoServlet?accion=ver&id=${e.id}" class="btn-action bg-info" title="Ver"><i class="fa-solid fa-eye"></i></a>
    <a href="EquipoServlet?accion=editar&id=${e.id}" class="btn-action bg-warning" title="Editar"><i class="fa-solid fa-pen"></i></a>
    <a href="EquipoServlet?accion=salud&id=${e.id}" class="btn-action bg-primary" title="Salud"><i class="fa-solid fa-heart-pulse"></i></a>
    <a href="EquipoServlet?accion=eliminar&id=${e.id}" class="btn-action bg-danger" 
       onclick="return confirm('¿Seguro de eliminar este registro?')" title="Eliminar"><i class="fa-solid fa-trash"></i></a>
</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>