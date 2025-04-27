import React, { useState, useRef, useEffect } from 'react';

export default function DropdownItem({ title, children }) {
  const [isOpen, setIsOpen] = useState(false);
  const [isMobile, setIsMobile] = useState(false);
  const ref = useRef(null);

  const toggleDropdown = () => setIsOpen(prev => !prev);

  // Определим: мобилка или нет
  useEffect(() => {
    const checkMobile = () => {
      setIsMobile(window.innerWidth <= 768); // можешь подставить своё значение
    };

    checkMobile(); // при монтировании
    window.addEventListener('resize', checkMobile);

    return () => window.removeEventListener('resize', checkMobile);
  }, []);

  // Закрытие при клике вне
  useEffect(() => {
    const handleClickOutside = (e) => {
      if (ref.current && !ref.current.contains(e.target)) {
        setIsOpen(false);
      }
    };
    document.addEventListener('click', handleClickOutside);
    return () => document.removeEventListener('click', handleClickOutside);
  }, []);

  return (
    <li className={`header__menu-item ${isOpen ? 'dropdown-menu__open' : ''}`} ref={ref}>
      <button
        className={`dropdown-menu__button ${isMobile ? 'mobile-dropdown__button' : ''}`}
        onClick={toggleDropdown}
      >
        {title}
      </button>

      {isOpen && (
        <ul className="dropdown-menu__list" style={{ position: 'relative' }}>
          {children}
        </ul>
      )}
    </li>
  );
}