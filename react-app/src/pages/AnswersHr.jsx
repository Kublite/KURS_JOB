import React, {useEffect, useState} from "react";

export default function AnswersHr(){
    const [statusApplications, setStatusApplications] = useState([]);

    useEffect(() => {
        fetch("/api/AnswersHr.php",{
            method: "Get",
            credentials: 'include',
        })
        .then((response) => response.json())
        .then((data) => {
            if (data.status === 'true') {
                setStatusApplications(data.applications);
                console.log(data);
            }}
        )
        .catch((error) => {
            console.error("Ошибка открытия:", error);
        })
    }, []);

    return( <main className="response-user">
        <div className="response-user__inner container">
        {statusApplications.length === 0 ? (
        <p>Вы не откликались на вакансии</p>
      ) : (
        <ul className="response-user__list">
             {statusApplications.map((applications) => (
                <li key={applications.application_id} className="response-user__item" style={{ 
                    justifyContent: 'space-between',
                    display: 'flex',
                  }}>
                    <div className="response-user__body">{applications.title}</div>
                    <div className="response-user__body">{applications.status=='approved'?<img width="30" height="30" src="https://img.icons8.com/pulsar-gradient/48/clipboard-approve.png" alt="clipboard-approve"/>:applications.status=='expectation'?<img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/4f6a84/hourglass--v1.png" alt="hourglass--v1"/>:<img width="30" height="30" src="https://img.icons8.com/pulsar-gradient/48/disclaimer.png" alt="disclaimer"/>}</div>
                </li>
             ))}
        </ul>
      )}
        </div>
    </main>)
}