import React from "react";
import { useNavigate } from 'react-router-dom';

export default function Logout(){
    const navigate = useNavigate();
    function handleLogout() {
        fetch('http://localhost/scripts/logout.php', {
            method: "POST",
            credentials: 'include'
        })
        .then(response=>response.json())
        .then((data)=>{
            if(data.success){
                navigate('/login', { replace: true });
            }
        })
        .catch((error) => {
            console.error("no", error);
        });
    }
    return(
        <a onClick={handleLogout} className="header__menu-link" style={{
            cursor: 'default'}}>Выйти</a>
    )
}