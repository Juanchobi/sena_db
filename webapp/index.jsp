<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TechXpertPro: Mantenimiento y Registro</title>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>

        <header>
            <h1>Guía Técnica: Mantenimiento de Hardware</h1>
            <p>Aprende a proteger tu equipo y extender su vida útil con <strong>TechXpertPro</strong>.</p>
        </header>

        <nav>
            <h2>Índice del Tutorial</h2>
            <ol>
                <li><a href="#herramientas">1. Kit de Herramientas</a></li>
                <li><a href="#limpieza">2. Limpieza de Polvo</a></li>
                <li><a href="#pasta">3. Pasta Térmica</a></li>
                <li><a href="#registro">4. Registro de Equipo (SENA)</a></li>
            </ol>
        </nav>

        <main>
            <section id="herramientas">
                <h2>1. Kit de Herramientas Esenciales</h2>
                <img src="https://picsum.photos/id/119/600/400" alt="Herramientas de PC">
                <p>Para un mantenimiento seguro, necesitas: un juego de destornilladores de precisión, soplador de aire, alcohol isopropílico y una manilla antiestática.</p>
            </section>

            <section id="limpieza">
                <h2>2. Limpieza de Polvo y Ventilación</h2>
                <img src="https://picsum.photos/id/160/600/400" alt="Limpieza de hardware">
                <p>El polvo obstruye el flujo de aire. Usa aire comprimido para limpiar ventiladores y disipadores, siempre sujetando las aspas para que no giren.</p>
            </section>

            <section id="pasta">
                <h2>3. Renovación de la Pasta Térmica</h2>
                <img src="https://picsum.photos/id/0/600/400" alt="Procesador y pasta térmica">
                <p>Limpia la pasta vieja con alcohol, aplica una pequeña cantidad en el centro del procesador y vuelve a colocar el disipador firmemente.</p>
            </section>

            <hr>
            <section id="registro" style="background: #f9f9f9; padding: 20px; border-radius: 10px; margin-top: 30px; border: 2px solid #2c3e50;">
                <h2>4. Registro de Mantenimiento (Módulo Codificado)</h2>
                <p>Una vez finalizado el mantenimiento físico, registre el equipo en la base de datos centralizada.</p>

                <form action="EquipoServlet" method="POST" style="display: flex; flex-direction: column; max-width: 400px; gap: 10px;">
                    <label for="nombre"><strong>Nombre del Equipo:</strong></label>
                    <input type="text" id="nombre" name="nombre" placeholder="Ej: Laptop-SENA-01" required style="padding: 8px; border-radius: 5px; border: 1px solid #ccc;">

                    <label for="marca"><strong>Marca del Equipo:</strong></label>
                    <input type="text" id="marca" name="marca" placeholder="Ej: HP, Dell, Lenovo" required style="padding: 8px; border-radius: 5px; border: 1px solid #ccc;">

                    <button type="submit" style="background-color: #27ae60; color: white; padding: 12px; border: none; border-radius: 5px; cursor: pointer; font-weight: bold;">
                    REGISTRAR EN BASE DE DATOS
                </button>
                </form>
            </section>
        </main>

        <footer>
            <p>Elaborado por: Juan Pablo Bermudez y Jairo de la Portilla | Aprendices SENA | Evidencia GA7-220501096-AA2-EV02</p>
        </footer>

    </body>

    </html>