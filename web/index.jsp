<%-- 
    Centro de Formación: SENA
    Programa: Análisis y Desarrollo de Software (ADSO)
    Aprendiz: Juan Bermudez / Jairo de la Portilla
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SENA - Gestión de Equipos</title>
    <style>
        :root { 
            --sky-blue: #00B4DB; 
            --deep-blue: #00324D; 
            --sena-orange: #FF6B00;
        }
        
        body { 
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #00B4DB 0%, #0083B0 100%);
            display: flex; justify-content: center; align-items: center;
            height: 100vh; margin: 0; overflow: hidden;
        }

        .login-card {
            background: white; padding: 40px; border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2); width: 380px; text-align: center;
            position: relative;
        }

        /* --- EFECTO LOGO 3D --- */
        .sena-logo-container {
            perspective: 1000px;
            margin-bottom: 20px;
        }
        .sena-logo { 
            width: 100px; 
            animation: rotacion3D 6s linear infinite;
            transform-style: preserve-3d;
            filter: drop-shadow(0 5px 15px rgba(0,0,0,0.1));
        }

        @keyframes rotacion3D {
            from { transform: rotateY(0deg); }
            to { transform: rotateY(360deg); }
        }

        h2 { color: var(--deep-blue); margin-bottom: 25px; font-size: 1.5rem; font-weight: 700; }
        
        .form-group { margin-bottom: 18px; text-align: left; }
        label { display: block; margin-bottom: 6px; font-size: 0.85em; color: #555; font-weight: 600; }
        
        input, select {
            width: 100%; padding: 12px; border: 2px solid #E1E8ED;
            border-radius: 10px; box-sizing: border-box; transition: 0.3s;
            font-size: 0.95em;
        }
        
        input:focus, select:focus { 
            border-color: var(--sky-blue); 
            outline: none; 
            box-shadow: 0 0 8px rgba(0,180,219,0.2);
        }

        button {
            width: 100%; padding: 15px; background: var(--sky-blue);
            color: white; border: none; border-radius: 10px;
            font-size: 1em; font-weight: bold; cursor: pointer;
            margin-top: 10px; transition: 0.3s;
            letter-spacing: 1px;
        }
        
        button:hover { background: var(--deep-blue); transform: translateY(-2px); }

        .error-msg { 
            background: #FFEBEE; color: #D32F2F; padding: 10px; 
            border-radius: 8px; font-size: 0.85em; margin-bottom: 15px; 
            border: 1px solid #FFCDD2;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <div class="sena-logo-container">
            <img src="img/logo_sena.png" class="sena-logo" alt="SENA">
        </div>
        
        <h2>Ingreso al Sistema</h2>
        
        <% if(request.getParameter("error") != null) { %>
            <div class="error-msg">⚠️ Credenciales incorrectas o error de conexión</div>
        <% } %>

        <form action="UsuarioServlet" method="POST" autocomplete="on">
            <input type="hidden" name="accion" value="login">
            
            <div class="form-group">
                <label>Usuario / Documento</label>
                <input type="text" name="username" id="usuario" required 
                       placeholder="Ingrese su documento" autocomplete="username">
            </div>
            
            <div class="form-group">
                <label>Contraseña</label>
                <input type="password" name="password" required 
                       placeholder="••••••••" autocomplete="current-password">
            </div>
            
            <div class="form-group">
                <label>Sede de Atención (Nacional)</label>
                <select name="empresa" required>
                    <option value="BOG_DT">Distrito Capital - Dirección General</option>
                    <option value="BOG_CE">Centro de Electricidad y Electrónica</option>
                    </select>
            </div>
            
            <button type="submit">INICIAR SESIÓN</button>
        </form>
    </div>
</body>
</html>