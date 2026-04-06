import React, { useState } from 'react';
import './App.css';

/**
 * Evidencia: GA7-220501096-AA4-EV03
 * Aprendiz: Juan Pablo Bermudez
 */
function App() {
  const [equipo, setEquipo] = useState({ nombre: '', marca: '' });

  const manejarGuardado = (e) => {
    e.preventDefault();
    alert(`Equipo ${equipo.nombre} registrado con éxito.`);
    console.log("Datos capturados:", equipo);
  };

  return (
    <div className="App" style={{ padding: '50px', textAlign: 'center' }}>
      <header style={{ background: '#282c34', color: 'white', padding: '15px', borderRadius: '10px' }}>
        <h1>SENA: Gestión de Inventario</h1>
      </header>

      <form onSubmit={manejarGuardado} style={{ marginTop: '30px', border: '1px solid #ccc', padding: '20px', display: 'inline-block' }}>
        <h3>Registrar Nuevo Equipo</h3>
        <input 
          type="text" 
          placeholder="Nombre del equipo" 
          onChange={(e) => setEquipo({...equipo, nombre: e.target.value})} 
          required 
        /><br/><br/>
        <input 
          type="text" 
          placeholder="Marca (HP, Lenovo, etc.)" 
          onChange={(e) => setEquipo({...equipo, marca: e.target.value})} 
          required 
        /><br/><br/>
        <button type="submit">Guardar</button>
      </form>
    </div>
  );
}

export default App;