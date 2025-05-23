import React, {useState, useEffect} from "react";
import { useParams } from 'react-router-dom';

export default function Message(){
    const [Message, setMessage] = useState([]);
    const { id } = useParams();

    useEffect(() => {
            fetch("http://localhost/api/tableMessage.php",{
                method: "POST",
                credentials: 'include',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: `message_id=${id}`,
            })
            .then((response) => response.json())
            .then((data) => {
                if (data.status === 'true') {
                    setMessage(data.messages);
                    console.log(data);
                }})
            .catch((error) => {
                console.error("Ошибка открытия:", error);
            })
        }, []);
    return(
        <main className="Message">
            <div className="Message__inner container">
                {Message.map((messages) => (
                    <div key={messages.id}>
                        <div className="tableMessage__body">{messages.subject}</div>
                        <div className="tableMessage__body">{messages.full_name}</div>
                        <div className="tableMessage__body">{messages.contact_info}</div>
                        <div className="tableMessage__body">{messages.message}</div>
                        <div className="tableMessage__body">{messages.created_at}</div>
                    </div>

                ))}
            </div>
        </main>
    )
}