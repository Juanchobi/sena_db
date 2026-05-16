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
    <title>SENA - Ficha Técnica de Activos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --sena-blue: #00324D; --sena-green: #39A900; }
        body { background: #f4f7f6; font-family: 'Segoe UI', sans-serif; }
        .card-header { background: var(--sena-blue); color: white; border-radius: 8px 8px 0 0 !important; }
        .section-title { border-bottom: 2px solid var(--sena-green); color: var(--sena-blue); font-weight: bold; margin-bottom: 15px; }
        .form-label { font-weight: 600; color: #444; font-size: 0.9rem; }
        .btn-sena { background: var(--sena-green); color: white; font-weight: bold; }
        .btn-sena:hover { background: #2d8500; color: white; }
    </style>
</head>
<body class="p-4">

<div class="container">
    <div class="card shadow-lg border-0">
        <div class="card-header p-3 d-flex justify-content-between align-items-center">
            <h4 class="mb-0"><i class="fa-solid fa-file-invoice me-2"></i> 
                <c:choose>
                    <c:when test="${modo == 'nuevo'}">Nuevo Registro de Activo</c:when>
                    <c:otherwise>Ficha Técnica: ${equipo.placa_inventario}</c:otherwise>
                </c:choose>
            </h4>
            <a href="EquipoServlet?accion=listar" class="btn btn-outline-light btn-sm"><i class="fa-solid fa-arrow-left"></i> Volver</a>
        </div>
        
        <div class="card-body p-4">
            <form action="EquipoServlet" method="POST">
                <input type="hidden" name="id" value="${equipo.id}">
                <input type="hidden" name="accion" value="${modo == 'nuevo' ? 'insertar' : 'actualizar'}">

                <div class="section-title"><i class="fa-solid fa-info-circle"></i> Información General</div>
                <div class="row g-3 mb-4">
                    <div class="col-md-6">
                        <label class="form-label">Nombre del Equipo</label>
                        <input type="text" name="nombre" class="form-control" value="${equipo.nombre}" required ${modo == 'ver' ? 'readonly' : ''}>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Marca</label>
                        <input type="text" name="marca" class="form-control" value="${equipo.marca}" required ${modo == 'ver' ? 'readonly' : ''}>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Modelo</label>
                        <input type="text" name="modelo" class="form-control" value="${equipo.modelo}" required ${modo == 'ver' ? 'readonly' : ''}>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Número de Serial</label>
                        <input type="text" name="serial" class="form-control ${modo != 'nuevo' ? 'bg-light' : ''}" 
                               value="${equipo.serial}" 
                               ${modo != 'nuevo' ? 'readonly' : ''} required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Placa Inventario</label>
                        <input type="text" name="placa" class="form-control" value="${equipo.placa_inventario}" required ${modo == 'ver' ? 'readonly' : ''}>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Técnico Asignado</label>
                        <input type="text" name="tecnico_asignado" class="form-control" value="${equipo.tecnico_asignado}" ${modo == 'ver' ? 'readonly' : ''}>
                    </div>
                </div>

                <div class="section-title"><i class="fa-solid fa-shield-halved"></i> Estado y Garantía</div>
                <div class="row g-3 mb-4">
                    <div class="col-md-4">
                        <label class="form-label">Fecha de Compra</label>
                        <input type="date" name="fechaCompra" class="form-control" value="${equipo.fechacompra}" ${modo == 'ver' ? 'readonly' : ''}>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Estado de Energía</label>
                        <select name="estado_energia" class="form-select" ${modo == 'ver' ? 'disabled' : ''}>
                            <option value="encendido" ${equipo.estado_energia == 'encendido' ? 'selected' : ''}>Encendido</option>
                            <option value="apagado" ${equipo.estado_energia == 'apagado' ? 'selected' : ''}>Apagado</option>
                        </select>
                    </div>
                </div>

                <div class="section-title"><i class="fa-solid fa-list-check"></i> Instalación de Software</div>
                <div class="row g-3 mb-4">
                    <div class="col-md-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="check_adobe" value="1" ${equipo.check_adobe == 1 ? 'checked' : ''} ${modo == 'ver' ? 'disabled' : ''}>
                            <label class="form-check-label">Adobe Reader</label>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="check_office" value="1" ${equipo.check_office == 1 ? 'checked' : ''} ${modo == 'ver' ? 'disabled' : ''}>
                            <label class="form-check-label">Microsoft Office</label>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="check_antivirus" value="1" ${equipo.check_antivirus == 1 ? 'checked' : ''} ${modo == 'ver' ? 'disabled' : ''}>
                            <label class="form-check-label">Antivirus</label>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="check_navegador" value="1" ${equipo.check_navegador == 1 ? 'checked' : ''} ${modo == 'ver' ? 'disabled' : ''}>
                            <label class="form-check-label">Navegadores</label>
                        </div>
                    </div>
                </div>

                <div class="mt-4 pt-3 border-top text-end">
                    <c:if test="${modo != 'ver'}">
                        <button type="submit" class="btn btn-sena btn-lg px-5">
                            <i class="fa-solid fa-floppy-disk me-2"></i> GUARDAR FICHA
                        </button>
                    </c:if>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>