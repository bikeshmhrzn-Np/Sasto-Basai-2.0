import React from 'react';
import { useNavigate } from 'react-router-dom';

function RoomCard({ room }) {
  const navigate = useNavigate();

  return (
    <div
      className="room-card"
      onClick={() => navigate(`/room/${room.id}`)}
    >
      <img
        src={room.image}
        alt={room.title}
      />

      <div className="room-content">
        <h3>{room.title}</h3>
        <p>{room.location}</p>

        <div className="room-bottom">
          <span>Rs. {room.price}</span>
          <button>View</button>
        </div>
      </div>
    </div>
  );
}

export default RoomCard;