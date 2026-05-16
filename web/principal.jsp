<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombre = (String) session.getAttribute("nombreUsuario");
    if (nombre == null) { response.sendRedirect("index.jsp"); return; }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>SENA - Estadísticas</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        :root { --sena-blue: #00324D; --sena-green: #39A900; }
        body { font-family: 'Segoe UI', sans-serif; background: #f4f7f9; margin: 0; }
        .top-bar { background: white; padding: 10px 40px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .main-content { display: flex; flex-direction: column; align-items: center; padding: 40px; }
        .charts-container { display: flex; gap: 30px; margin-bottom: 40px; }
        .chart-card { background: white; padding: 25px; border-radius: 15px; width: 380px; text-align: center; }
        .btn-iniciar { background: var(--sena-green); color: white; padding: 15px 50px; text-decoration: none; font-weight: bold; border-radius: 8px; font-size: 1.1rem; }
    </style>
</head>
<body>
    <div class="top-bar">
        <h2 style="color: var(--sena-blue);">RESUMEN TÉCNICO</h2>
        <span>👋 Hola, <b><%= nombre %></b></span>
    </div>

    <div class="main-content">
        <div class="charts-container">
            <div class="chart-card"><h3>EQUIPOS</h3><canvas id="chartEquipos"></canvas></div>
            <div class="chart-card"><h3>TICKETS</h3><canvas id="chartTickets"></canvas></div>
        </div>
        <a href="dashboard.jsp" class="btn-iniciar">INICIAR GESTIÓN</a>
    </div>

    <script>
        new Chart(document.getElementById('chartEquipos'), { type: 'doughnut', data: { labels: ['Ok', 'Falla'], datasets: [{ data: [80, 20], backgroundColor: ['#39A900', '#00324D'] }] } });
        new Chart(document.getElementById('chartTickets'), { type: 'doughnut', data: { labels: ['Pendientes'], datasets: [{ data: [1], backgroundColor: ['#39A900'] }] } });
    </script>
</body>
</html>