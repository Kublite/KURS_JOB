import React from 'react'
import { useState, useEffect } from 'react';

export default function useAuth(){
    const[auth, setAuth]=useState({
        loading:true, 
        authenticated: false,
        role: null})
    useEffect(()=>{
        fetch('http://localhost/api/session.php',{credentials: 'include'})// чтобы работали куки/сессии
        .then(response=>response.json())
        .then((data)=>
        setAuth({
            loading:false, 
            authenticated: data.authenticated,
            role: data.role //у всех пользователей есть роль
        }
        ))
        .catch(
            (error)=>{console.log(error);
                setAuth(
                    {
                    loading:false, 
                    authenticated: false,
                    role: null
                })
            }
        )

    })
    return auth;
}

