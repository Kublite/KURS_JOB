import React, { useState, useEffect } from "react";

export default function ResponseUsers(){
    const [ResponseUsers, setResponseUsers] = useState([]);

    useEffect(() => {
        fetch("http://localhost/api/getResponse.php",{
            method: "Get",
            credentials: 'include',
        })
        .then((response) => response.json())
        .then((data) => {
            if (data.status === 'true') {
                setResponseUsers(data.applications);
                console.log(data);
            }})
        .catch((error) => {
            console.error("Ошибка открытия:", error);
        })
    }, []);

    function updateStatus(applicationId, newStatus) {
        fetch("http://localhost/api/updateApplications.php", {
          method: 'POST',
          credentials: 'include',
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
          body: `application_id=${applicationId}&status=${newStatus}`,
        })
          .then((response) => response.json())
          .then((data) => {
            if (data.status === 'success') {
              alert('Статус обновлён');
              // по желанию: обнови список вручную
            } else {
              alert('Ошибка: ' + data.message);
            }
          })
          .catch((error) => {
            console.error("Ошибка:", error);
          });
      }

    return(
    <main className="response-user">
        <div className="response-user__inner container">
        {ResponseUsers.length === 0 ? (
        <p>Откликов пока нет</p>
      ) : (
        <ul className="response-user__list">
             {ResponseUsers.map((applications) => (
                <li key={applications.application_id} className="response-user__item">
                    <div className="response-user__body">{applications.title}</div>
                    <div className="response-user__body">{applications.full_name}</div>
                    <div className="response-user__body">
                        <button className="response-user__rejected" onClick={() => updateStatus(applications.application_id, 'rejected')}>Отказаться</button>
                    </div>
                    <div className="response-user__body">
                        <button className="response-user__approved" onClick={() => updateStatus(applications.application_id, 'approved')}>Согласиться</button>
                    </div>
                </li>
             ))}
        </ul>
      )}
        </div>
    </main>
    )
}