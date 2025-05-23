import React, {useState, useEffect} from "react";
import { useNavigate } from 'react-router-dom';

export default function TableMessage(){
    const navigate = useNavigate();
    const [tableMessage, setTableMessage] = useState([]);

    useEffect(() => {
        fetch("http://localhost/api/tableMessage.php",{
            method: "Get",
            credentials: 'include',
        })
        .then((response) => response.json())
        .then((data) => {
            if (data.status === 'true') {
                setTableMessage(data.messages);
                console.log(data);
            }})
        .catch((error) => {
            console.error("Ошибка открытия:", error);
        })
    }, []);

    return(
        <main className="tableMessage">
        <div className="tableMessage__inner container">
        {tableMessage.length === 0 ? (
        <p>Писем нет</p>
      ) : (
        <ul className="tableMessage__list">
             {tableMessage.map((messages) => (
                <li key={messages.id} className="tableMessage__item">
                    <div className="tableMessage__body tableMessage__cursor" onClick={() => navigate(`/TableMessage/Message/${messages.id}`)}>{messages.subject}</div>
                    <div className="tableMessage__body tableMessage__cursor">{messages.full_name}</div>
                    <div className="tableMessage__body tableMessage__cursor">{messages.contact_info}</div>
                    <div className="tableMessage__body">{messages.created_at}</div>
                </li>
             ))}
        </ul>
      )}
        </div>
    </main>
    )
}