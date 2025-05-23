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
                        <h1 className="Message__body">{messages.subject}</h1>
                        <h2 className="Message__body">{messages.full_name}</h2>
                        <h3 className="Message__body">{messages.contact_info}</h3>
                        <p className="Message__body">{messages.message}</p>
                        <p className="Message__body">{messages.created_at}</p>
                    </div>

                ))}
            </div>
        </main>
    )
}