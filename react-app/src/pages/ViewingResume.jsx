import React, {useState, useEffect} from 'react';
import { useParams } from 'react-router-dom';
import MDEditor from "@uiw/react-md-editor";

export default function ViewingResume(){
    const [resume, setResume] = useState(null);
    const { id } = useParams();
    const [image, setImage] = useState(null);

    const handleImageUpload = (e) => { //загрузка фото
        const file = e.target.files[0];
        if (file) {
            setImage(URL.createObjectURL(file));
            setPhotoFile(file); 
        }
    };

     useEffect(() => {
        fetch("http://localhost/api/getResume.php", {
            method: 'POST',
            credentials: 'include',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: `user_id=${id}`,
        })
        .then((response) => response.json())
        .then((data) => {
            if (data.status === 'true') {
            setResume(data.resume[0]);
            console.log(data.resume);
            }
        })
    }, []);

    return(
        <main>
            <div>
                {resume &&(
                <div key={resume.id} className="viewing-resume__inner container" data-color-mode="light">
                <div className="resume__body">
                        <div className="resume__img">
                            <img src={image ? image : `http://localhost/${resume.photo_path}`} alt=""  className="resume__photo-width"/>
                        </div>
                        <div className="resume__input">
                            <div className="createOffers__form-block">
                                <input
                                className="createOffers__form-block-input"
                                type="text"
                                placeholder="ФИО"
                                name="fullName"
                                defaultValue={resume.full_name}
                                disabled
                                />
                            </div>
                            <div className="createOffers__form-block">
                                <input
                                className="createOffers__form-block-input"
                                type="text"
                                placeholder="Желаемая должность"
                                name="desiredPosition"
                                defaultValue={resume.desired_position}
                                disabled
                                />
                            </div> 
                            <div className="createOffers__form-block">
                                    <input
                                    className="createOffers__form-block-input"
                                    type="text"
                                    placeholder="Город"
                                    name="city"
                                    defaultValue={resume.city}
                                    disabled
                                    />
                                </div> 
                            <div>Контактная информация</div>
                            <div className="resume__contact-information">
                                <div className="createOffers__form-block">
                                    <input
                                    className="createOffers__form-block-input"
                                    type="text"
                                    placeholder="Номер телефона"
                                    name="phone"
                                    defaultValue={resume.phone}
                                    disabled
                                    />
                                </div> 
                                <div className="createOffers__form-block">
                                    <input
                                    className="createOffers__form-block-input"
                                    type="email"
                                    placeholder="Почта"
                                    name="email"
                                    defaultValue={resume.email}
                                    disabled
                                    />
                                </div> 
                                <div className="createOffers__form-block">
                                    <input
                                    className="createOffers__form-block-input"
                                    type="text"
                                    placeholder="Telegram"
                                    name="telegram"
                                    defaultValue={resume.telegram}
                                    disabled
                                    />
                                </div> 
                                <div className="createOffers__form-block">
                                    <input
                                    className="createOffers__form-block-input"
                                    type="text"
                                    placeholder="Git"
                                    name="git"
                                    defaultValue={resume.git}
                                    disabled
                                    />
                                </div> 
                            </div>
                            <select className="offers-filters__form-block-select" name="speciality" defaultValue={resume.speciality} disabled>
                                <option value="">Специальность</option>
                            </select>
                        </div>
                    </div>
                    <MDEditor.Markdown source={resume.description} />
                </div>
                )}
            </div>
        </main>
    )
}