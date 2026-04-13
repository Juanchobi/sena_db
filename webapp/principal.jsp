<%-- 
    Archivo: principal.jsp
    Proyecto: Sistema de Gestión de Mantenimiento de Equipos - SENA
    Descripción: Panel principal con navegación y visualización de métricas.
    Aprendices: Juan Pablo Bermúdez - Jairo de la Portilla
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Administrativo - SENA</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        :root { --sena-green: #39A900; --sena-blue: #00324D; }
        body { font-family: 'Segoe UI', sans-serif; background-color: #f4f4f4; margin: 0; }
        header { background: var(--sena-blue); color: white; padding: 20px; text-align: center; }
        .container { max-width: 1000px; margin: 20px auto; padding: 20px; }
        
        /* Estilo de los Botones de Navegación */
        .menu-nav { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 40px; }
        .btn-menu { 
            background: white; border: 2px solid var(--sena-green); color: var(--sena-blue);
            padding: 30px; text-decoration: none; text-align: center; font-weight: bold;
            font-size: 1.2rem; border-radius: 10px; transition: 0.3s;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .btn-menu:hover { background: var(--sena-green); color: white; transform: translateY(-5px); }

        /* Contenedor de Gráficas */
        .charts-container { display: flex; justify-content: space-around; flex-wrap: wrap; gap: 20px; }
        .chart-box { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); width: 45%; }
        h3 { text-align: center; color: var(--sena-blue); }
    </style>
</head>
<body>

<header>
    <h1>SISTEMA DE GESTIÓN TÉCNICA - ADSO SENA</h1>
    <p>Bienvenido al Panel de Control de Inventario</p>
</header>

<div class="container">
    <nav class="menu-nav">
        <a href="EquipoServlet?action=list" class="btn-menu">
            📦 EQUIPOS EN INVENTARIO
        </a>
        
        <a href="registro_detalle.jsp" class="btn-menu">
            📝 NUEVO REGISTRO TÉCNICO
        </a>
    </nav>

    <section class="charts-container">
        <div class="chart-box">
            <h3>Protocolos Preventivos</h3>
            <canvas id="chartProtocolos"></canvas>
        </div>
        <div class="chart-box">
            <h3>Diagnóstico de Equipos</h3>
            <canvas id="chartDiagnostico"></canvas>
        </div>
    </section>
</div>

<script>
    // Configuración Gráfica de Protocolos (Doughnut)
    const ctxProt = document.getElementById('chartProtocolos').getContext('2d');
    new Chart(ctxProt, {
        type: 'doughnut',
        data: {
            labels: ['Limpieza Física', 'Optimización SO', 'Cambio de Pasta'],
            datasets: [{
                data: [45, 30, 25],
                backgroundColor: ['#39A900', '#00324D', '#ff9f40']
            }]
        }
    });

    // Configuración Gráfica de Diagnóstico (Pie)
    const ctxDiag = document.getElementById('chartDiagnostico').getContext('2d');
    new Chart(ctxDiag, {
        type: 'pie',
        data: {
            labels: ['Operativos', 'En Mantenimiento', 'Fuera de Servicio'],
            datasets: [{
                data: [70, 20, 10],
                backgroundColor: ['#28a745', '#ffc107', '#dc3545']
            }]
        }
    });
</script>

</body>
</html>