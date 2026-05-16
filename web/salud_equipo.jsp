<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SENA - Salud de Activo</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="p-4 bg-light text-center">
    <div class="container mt-5">
        <div class="card shadow border-0" style="max-width: 600px; margin: auto;">
            <div class="card-body">
                <h2 class="fw-bold mb-4"><i class="fa-solid fa-heart-pulse text-danger"></i> Estado de Garantía</h2>
                <hr>
                <div class="text-start mb-4">
                    <p><strong>Equipo:</strong> ${equipo.nombre} ${equipo.marca}</p>
                    <p><strong>Serial:</strong> ${equipo.serial}</p>
                    <p><strong>Fecha de Compra:</strong> ${equipo.fechacompra}</p>
                </div>
                
                <h5 class="text-secondary">Vida Útil Estimada</h5>
                <div class="progress mb-4" style="height: 30px;">
                    <div class="progress-bar bg-success" style="width: 75%">75% Salubre</div>
                </div>
                
                <p class="small text-muted">Diagnóstico generado según la fecha de adquisición registrada.</p>
                <a href="EquipoServlet?accion=listar" class="btn btn-primary px-4">Volver al Inventario</a>
            </div>
        </div>
    </div>
</body>
</html>