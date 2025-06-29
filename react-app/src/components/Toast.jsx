import React, { useEffect } from 'react';

export default function Toast({ message, type = "success", onClose }) {
  useEffect(() => {
    const timer = setTimeout(() => {
      onClose();
    }, 3000);
    return () => clearTimeout(timer);
  }, [onClose]);

  return (
    <div className={`toast toast--${type}`}>
      {message}
      <button className="toast__close" onClick={onClose}>×</button>
    </div>
  );
}