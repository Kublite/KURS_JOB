import React, { useState, useEffect, useRef } from "react";

export default function NotificationDropdown() {
  const [isOpen, setIsOpen] = useState(false);
  const [notifications, setNotifications] = useState([]);
  const [isMobile, setIsMobile] = useState(window.innerWidth <= 768);
  const ref = useRef(null);

  useEffect(() => {
    const handleResize = () => setIsMobile(window.innerWidth <= 768);
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  useEffect(() => {
    if (!isMobile) {
      const handleClickOutside = (e) => {
        if (ref.current && !ref.current.contains(e.target)) {
          setIsOpen(false);
        }
      };
      document.addEventListener("click", handleClickOutside);
      return () => document.removeEventListener("click", handleClickOutside);
    }
  }, [isMobile]);

  useEffect(() => {
    fetch("/api/getNotifications.php", {
      method: "GET",
      credentials: "include",
    })
      .then(res => res.json())
      .then(data => {
        if (data.status === "success") setNotifications(data.notifications);
      })
      .catch(console.error);
  }, []);

  const markAsRead = (id) => {
    fetch("/api/markNotificationRead.php", {
      method: "POST",
      credentials: "include",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: `id=${id}`,
    })
      .then(res => res.json())
      .then(data => {
        if (data.status === "success") {
          setNotifications(prev =>
            prev.map(n => (n.id === id ? { ...n, is_read: "1" } : n))
          );
        }
      })
      .catch(console.error);
  };

  const hasUnread = notifications.some(n => Number(n.is_read) === 0);

  if (isMobile) {
    return (
      <li className="mobile-overlay__item" ref={ref}>
        <button
          className={`dropdown-menu__button mobile-dropdown__button`}
          onClick={() => setIsOpen(!isOpen)}
          aria-expanded={isOpen}
        >
          <span className={`mobile-overlay__button-text ${hasUnread ? "mobile-overlay__button-text--unread" : ""}`}>
            Уведомления
          </span>
        </button>

        {isOpen && (
          <ul className="notify__list">
            {notifications.length === 0 ? (
              <li className="notify__item">Нет уведомлений</li>
            ) : (
              notifications.map(notif => (
                <li
                  key={notif.id}
                  className={`notify__item ${Number(notif.is_read) === 0 ? "mobile-overlay__item--unread" : ""}`}
                >
                  <span style={{ fontWeight: Number(notif.is_read) === 0 ? "bold" : "normal" }}>
                    {notif.message}
                  </span>
                  {Number(notif.is_read) === 0 && (
                    <button
                      className="notifications__mark-read"
                      title="Пометить как прочитанное"
                      onClick={() => markAsRead(notif.id)}
                    >
                      ✖
                    </button>
                  )}
                </li>
              ))
            )}
          </ul>
        )}
      </li>
    );
  }

  return (
    <li className={`header__menu-item ${isOpen ? "dropdown-menu__open" : ""}`} ref={ref}>
      <button className="dropdown-menu__button" onClick={() => setIsOpen(!isOpen)} aria-expanded={isOpen}>
        <img
          src={hasUnread ? "/img/bellRed.svg" : "/img/bellDark.svg"}
          alt="Уведомления"
          width="24"
          height="24"
        />
      </button>

      {isOpen && (
        <ul className="dropdown-menu__list">
          {notifications.length === 0 ? (
            <li className="notifications__item">Нет уведомлений</li>
          ) : (
            notifications.map(notif => (
              <li
                key={notif.id}
                className={`notifications__item ${Number(notif.is_read) === 0 ? "unread" : ""}`}
              >
                <span style={{ fontWeight: Number(notif.is_read) === 0 ? "bold" : "normal" }}>
                  {notif.message}
                </span>
                {Number(notif.is_read) === 0 && (
                  <button
                    className="notifications__mark-read"
                    onClick={() => markAsRead(notif.id)}
                    title="Пометить как прочитанное"
                  >
                    ✖
                  </button>
                )}
              </li>
            ))
          )}
        </ul>
      )}
    </li>
  );
}
