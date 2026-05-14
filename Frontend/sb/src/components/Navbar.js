import React from 'react';
import { Link } from 'react-router-dom';

import logo from '../logo.png';
import './Navbar.css';

function Navbar() {
  return (
    <div className="navbar">
      <div className="logo-section">
        <img src={logo} alt="SastoBasai Logo" className="logo" />
        <h2>SastoBasai</h2>
      </div>

      <div>
        <Link to="/">Home</Link>
        <Link to="/add-room">Add Room</Link>
      </div>
    </div>
  );
}

export default Navbar;