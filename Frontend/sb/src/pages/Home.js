import React, { useEffect, useState } from 'react';
import API from '../services/api';
import RoomCard from '../components/RoomCard';
import './Home.css';

function Home() {
  const [rooms, setRooms] = useState([]);
  const [search, setSearch] = useState('');

  useEffect(() => {
    fetchRooms();
  }, []);

  const fetchRooms = async () => {
    try {
      const response = await API.get('rooms/');
      setRooms(response.data);
    } catch (error) {
      console.log(error);
    }
  };

  const filteredRooms = rooms.filter((room) =>
    room.title.toLowerCase().includes(search.toLowerCase()) ||
    room.location.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="container">
      <div className="hero">
        <h1>SastoBasai</h1>
        <p>Find affordable rooms in Nepal</p>
      </div>

      <input
        type="text"
        placeholder="Search rooms..."
        className="search-box"
        onChange={(e) => setSearch(e.target.value)}
      />

      <div className="room-grid">
        {filteredRooms.map((room) => (
          <RoomCard key={room.id} room={room} />
        ))}
      </div>
    </div>
  );
}

export default Home;