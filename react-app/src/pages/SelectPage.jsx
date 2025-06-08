import React from "react";
import { Link } from 'react-router-dom';


export default function SelectPage(){
    return(
        <main>
            <div className="resume__inner container">
                <label>Какую страницу будем редактировать?</label>
                <ul className="edit-List">
                    <li className="edit-Item">
                        <Link to='/CareerCenter'>О центре</Link>
                    </li>
                    <li className="edit-Item">
                        <Link to='/News'>Новости</Link>
                    </li>
                    <li className="edit-Item">
                        <Link to='/Rabotodatelyam'>Работодателям</Link>
                    </li>
                    <li className="edit-Item">
                       <Link to='/Praktika'>О практке</Link>
                    </li>
                 </ul>
            </div>
        </main>
    )

}