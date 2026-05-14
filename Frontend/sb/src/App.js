import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';

import Navbar from './components/Navbar';
import Home from './pages/Home';
import RoomDetail from './pages/RoomDetail';
import AddRoom from './pages/AddRoom';

import './App.css';

function App() {
  return (
    <BrowserRouter>
      <Navbar />

      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/room/:id" element={<RoomDetail />} />
        <Route path="/add-room" element={<AddRoom />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;