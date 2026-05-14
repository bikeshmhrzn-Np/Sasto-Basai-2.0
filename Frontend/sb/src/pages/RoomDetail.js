import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import API from '../services/api';

function RoomDetail() {
  const { id } = useParams();
  const [room, setRoom] = useState(null);

  useEffect(() => {
    fetchRoom();
  }, []);

  const fetchRoom = async () => {
    const response = await API.get(`rooms/${id}/`);
    setRoom(response.data);
  };

  if (!room) return <h2>Loading...</h2>;

  return (
    <div className="detail-container">
      <img src={room.image} alt={room.title} className="detail-image" />

      <h1>{room.title}</h1>
      <p>{room.description}</p>
      <h3>{room.location}</h3>
      <h2>Rs. {room.price}</h2>

      <button className="book-btn">Book Now</button>
    </div>
  );
}

export default RoomDetail;