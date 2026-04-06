import React, { useState } from 'react';
import './App.css';

/**
 * Componente: Registro de Equipos (Módulo de Hardware)
 * Evidencia: GA7-220501096-AA4-EV03
 * Aprendiz: Juan Pablo Bermudez
 */
function App() {
  const [equipo, setEquipo] = useState({ nombre: '', marca: '' });

  const enviarDatos = (e) => {
    e.preventDefault();
    alert(`Equipo ${equipo.nombre} registrado.`);
  };

  return (
    <div className="App" style={{ padding: '40px', textAlign: 'center' }}>
      <header style={{ background: '#00324D', color: 'white', padding: '20px', borderRadius: '10px' }}>
        <h1>SENA - Gestión de Inventario</h1>
      </header>
      <form onSubmit={enviarDatos} style={{ marginTop: '30px', border: '1px solid #ccc', padding: '20px', display: 'inline-block' }}>
        <h2>Registrar Hardware</h2>
        <input 
          type="text" 
          placeholder="Nombre del equipo" 
          onChange={(e) => setEquipo({...equipo, nombre: e.target.value})} 
          style={{ display: 'block', marginBottom: '10px', width: '250px' }}
        />
        <input 
          type="text" 
          placeholder="Marca" 
          onChange={(e) => setEquipo({...equipo, marca: e.target.value})} 
          style={{ display: 'block', marginBottom: '10px', width: '250px' }}
        />
        <button type="submit" style={{ cursor: 'pointer' }}>Guardar Equipo</button>
      </form>
    </div>
  );
}

export default App;