<%-- 
    Archivo: registro_detalle.jsp
    Proyecto: Sistema de Gestión de Mantenimiento de Equipos - SENA
    Descripción: Formulario detallado para el ingreso de especificaciones técnicas.
    Aprendiz: Juan Pablo Bermúdez
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro Técnico - SENA</title>
    <style>
        :root { --sena-green: #39A900; --sena-blue: #00324D; }
        body { font-family: 'Segoe UI', sans-serif; background-color: #f4f4f4; padding: 20px; }
        .form-container { 
            background: white; padding: 30px; border-radius: 10px; 
            max-width: 600px; margin: auto; box-shadow: 0 4px 15px rgba(0,0,0,0.1); 
        }
        h2 { color: var(--sena-blue); border-bottom: 3px solid var(--sena-green); padding-bottom: 10px; }
        .grid-form { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        .form-group { display: flex; flex-direction: column; margin-bottom: 15px; }
        .full-width { grid-column: span 2; }
        label { font-weight: bold; margin-bottom: 5px; color: #555; font-size: 0.9em; }
        input, select, textarea { 
            padding: 10px; border: 1px solid #ccc; border-radius: 5px; font-size: 1em; 
        }
        .btn-guardar { 
            background: var(--sena-green); color: white; border: none; 
            padding: 15px; border-radius: 5px; cursor: pointer; font-weight: bold; 
            font-size: 1.1em; transition: 0.3s; margin-top: 10px;
        }
        .btn-guardar:hover { background: #2d8500; }
        .btn-volver { 
            display: block; text-align: center; margin-top: 15px; 
            text-decoration: none; color: var(--sena-blue); font-size: 0.9em; 
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>📝 Registro Detallado de Equipo</h2>
    
    <form action="EquipoServlet" method="POST">
        <div class="grid-form">
            <div class="form-group">
                <label>Nombre del Equipo:</label>
                <input type="text" name="nombre" placeholder="Ej: PC-LAB01" required>
            </div>
            <div class="form-group">
                <label>Marca:</label>
                <input type="text" name="marca" placeholder="Ej: HP, Dell, Lenovo" required>
            </div>
            <div class="form-group">
                <label>Modelo:</label>
                <input type="text" name="modelo" placeholder="Ej: EliteBook 840" required>
            </div>
            <div class="form-group">
                <label>Número de Serial:</label>
                <input type="text" name="serial" placeholder="S/N Único" required>
            </div>

            <div class="form-group">
                <label>Memoria RAM:</label>
                <input type="text" name="ram" placeholder="Ej: 16GB DDR4">
            </div>
            <div class="form-group">
                <label>Almacenamiento:</label>
                <input type="text" name="tipoDisco" placeholder="Ej: SSD 512GB">
            </div>
            <div class="form-group">
                <label>Dirección MAC / IP:</label>
                <input type="text" name="mac" placeholder="00:00:00:00:00:00">
            </div>
            <div class="form-group">
                <label>Tipo de Servicio:</label>
                <select name="estado">
                    <option value="Mantenimiento Preventivo">Mantenimiento Preventivo</option>
                    <option value="Mantenimiento Correctivo">Mantenimiento Correctivo</option>
                    <option value="Diagnóstico Inicial">Diagnóstico Inicial</option>
                </select>
            </div>

            <div class="form-group full-width">
                <label>Observaciones Técnicas:</label>
                <textarea name="observaciones" rows="3" placeholder="Detalles adicionales del estado del equipo..."></textarea>
            </div>
        </div>

        <button type="submit" class="btn-guardar">GUARDAR EN BASE DE DATOS</button>
        <a href="principal.jsp" class="btn-volver">❌ Cancelar y Volver</a>
    </form>
</div>

</body>
</html>