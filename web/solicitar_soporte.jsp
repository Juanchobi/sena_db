<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Solicitar Soporte - TechXpert Pro</title>
    <style>
        :root { --sena-blue: #00324D; --sena-green: #39A900; --gray-light: #f4f7f6; }
        body { font-family: 'Segoe UI', sans-serif; background: var(--gray-light); padding: 40px 20px; }
        .form-container { 
            background: white; max-width: 550px; margin: auto; 
            padding: 35px; border-radius: 20px; box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            border-top: 8px solid var(--sena-green);
        }
        h2 { color: var(--sena-blue); text-align: center; margin-bottom: 5px; text-transform: uppercase; }
        .group { margin-bottom: 20px; }
        label { display: block; font-weight: 600; margin-bottom: 8px; color: var(--sena-blue); }
        input, textarea, select { 
            width: 100%; padding: 12px; border: 2px solid #e1e1e1; 
            border-radius: 10px; box-sizing: border-box; font-size: 15px;
        }
        input:focus, textarea:focus, select:focus { border-color: var(--sena-green); outline: none; }
        .btn-enviar { 
            width: 100%; background: var(--sena-green); color: white; border: none; 
            padding: 16px; border-radius: 10px; font-weight: bold; cursor: pointer; 
            font-size: 17px; transition: 0.3s;
        }
        .btn-enviar:hover { background: #2d8500; transform: translateY(-2px); }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Centro de Soporte</h2>
    <p style="text-align:center; color:#666;">TechXpert Pro - Nueva Solicitud</p>
    
    <form action="EquipoServlet" method="POST">
        <!-- VITAL: Coincidir con el if(accionForm.equals("guardar_ticket")) del Servlet -->
        <input type="hidden" name="accion_form" value="guardar_ticket">

        <div class="group">
            <label>Nombre del Usuario</label>
            <!-- name="usuario" -> Servlet: request.getParameter("usuario") -->
            <input type="text" name="usuario" required placeholder="Tu nombre completo">
        </div>

        <div class="group">
            <label>ID del Equipo (Número)</label>
            <!-- name="id_equipo" -> Servlet: Integer.parseInt(request.getParameter("id_equipo")) -->
            <input type="number" name="id_equipo" required placeholder="Ej: 101">
        </div>

        <div class="group">
            <label>Categoría de la Falla</label>
            <!-- name="tipo_falla" -> Servlet: request.getParameter("tipo_falla") -->
            <select name="tipo_falla">
                <option value="Hardware">Hardware (Pantalla, Teclado, Disco)</option>
                <option value="Software">Software (Windows, Office, Virus)</option>
                <option value="Red">Red / Internet</option>
            </select>
        </div>
        <div class="group">
    <label>Correo Institucional</label>
    <!-- El name="correo" es clave para que el Servlet lo encuentre -->
    <input type="email" name="correo" required placeholder="tu-correo@ejemplo.com">
</div>

        <div class="group">
            <label>Nivel de Prioridad</label>
            <!-- name="prioridad" -> Debe coincidir con los valores del ENUM en MySQL -->
            <select name="prioridad">
                <option value="Baja">Baja</option>
                <option value="Media" selected>Media</option>
                <option value="Alta">Alta</option>
            </select>
        </div>

        <div class="group">
            <label>Descripción del Problema</label>
            <!-- name="descripcion" -> Servlet: request.getParameter("descripcion") -->
            <textarea name="descripcion" required placeholder="Describe brevemente el fallo..." rows="4"></textarea>
        </div>

        <button type="submit" class="btn-enviar">📩 Enviar Requerimiento</button>
        
        <a href="EquipoServlet?accion=portal" style="display:block; text-align:center; margin-top:15px; text-decoration:none; color:#777;">Cancelar y volver</a>
    </form>
</div>

</body>
</html>