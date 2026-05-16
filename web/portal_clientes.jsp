<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>SENA - Portal de Soporte al Cliente</title>
    <style>
        :root { --sena-blue: #00324D; --sena-green: #39A900; --support-blue: #007bff; --bg-light: #f8f9fa; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: var(--bg-light); margin: 0; padding: 0; }
        
        .navbar { background: var(--sena-blue); color: white; padding: 1rem 2rem; border-bottom: 5px solid var(--sena-green); }
        
        .container { max-width: 1000px; margin: 40px auto; padding: 0 20px; }
        
        .welcome-section { text-align: center; margin-bottom: 50px; }
        .welcome-section h2 { color: var(--sena-blue); font-size: 2.2rem; margin-bottom: 10px; }
        .welcome-section p { color: #555; font-size: 1.1rem; }

        .service-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); 
            gap: 25px; 
        }

        .service-card {
            background: white;
            border-radius: 15px;
            padding: 35px;
            text-align: center;
            box-shadow: 0 10px 20px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            text-decoration: none;
            color: inherit;
            display: flex;
            flex-direction: column;
            align-items: center;
            border: 1px solid #eee;
        }

        .service-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            border-color: var(--support-blue);
        }

        .service-card .icon-box {
            width: 80px;
            height: 80px;
            background: rgba(0, 123, 255, 0.1);
            color: var(--support-blue);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .service-card h3 { margin: 15px 0; color: var(--sena-blue); }
        .service-card p { color: #666; font-size: 0.95rem; line-height: 1.6; }

        .footer {
            margin-top: 60px;
            text-align: center;
            padding: 30px;
            color: #777;
            font-size: 0.9rem;
            border-top: 1px solid #e0e0e0;
        }
        .dev-team { font-weight: bold; color: var(--sena-blue); }
    </style>
</head>
<body>

<div class="navbar">
    <strong>SENA</strong> | Centro de Experiencia al Cliente
</div>

<div class="container">
    <div class="welcome-section">
        <h2>¿En qué podemos ayudarte hoy?</h2>
        <p>Selecciona una opción para gestionar tus solicitudes técnicas.</p>
    </div>

    <div class="service-grid">
        
        <a href="solicitar_soporte.jsp" class="service-card">
            <div class="icon-box">🛠️</div>
            <h3>Reportar Incidente</h3>
            <p>¿Tu equipo no funciona correctamente? Crea un ticket técnico aquí.</p>
        </a>

        <a href="EquipoServlet?accion=mis_tickets" class="service-card">
            <div class="icon-box">🔍</div>
            <h3>Mis Solicitudes</h3>
            <p>Rastrea el progreso de tus reportes y mantente informado.</p>
        </a>

        <a href="#" class="service-card">
            <div class="icon-box">📚</div>
            <h3>Guías Rápidas</h3>
            <p>Encuentra soluciones inmediatas a problemas comunes de software.</p>
        </a>

    </div>

    <div class="footer">
        <p>© 2026 Sistema de Gestión de Activos - Todos los derechos reservados.</p>
        <p>Línea de soporte técnico: 01-8000-SENA</p>
        <p>Desarrollado por: <span class="dev-team">Jua Bermudez / Jairo de la Portilla</span></p>
    </div>
</div>

</body>
</html>