import React from "react";
import { Link } from 'react-router-dom';


export default function SelectPage(){
    return(
        <main>
            <div className="resume__inner container">
                <label>Какую страницу будем редактировать?</label>
                <ul className="edit-List">
                    <li className="edit-Item">
                        <Link to='/EditCareerCenter'>О центре</Link>
                    </li>
                    <li className="edit-Item">
                        <Link to='/EditNews'>Новости</Link>
                    </li>
                    <li className="edit-Item">
                        <Link to='/EditRabotodatelyam'>Работодателям</Link>
                    </li>
                    <li className="edit-Item">
                       <Link to='/EditPraktika'>О практке</Link>
                    </li>
                 </ul>
            </div>
        </main>
    )

}