import React from "react";

export default function Logout(){
    function handleLogout() {
        fetch('/api/logout.php', {
            method: "POST",
            credentials: 'include'
        })
        .then(response=>response.json())
        .then((data)=>{
            if(data.success){
                window.location.reload();
                window.location.href = '/';
            }
        })
        .catch((error) => {
            console.error("no", error);
            window.location.reload();
        });
    }
    return(
        <a onClick={handleLogout} className="header__menu-link" style={{
            cursor: 'default'}}>Выйти</a>
    )
}