import React, {useState, useEffect} from "react";
import MDEditor from "@uiw/react-md-editor";
import Toast from "../components/Toast";

export default function Resume(){
    const [image, setImage] = useState(null);
    const [photoFile, setPhotoFile] = useState(null);
    const [description, setDescription] = useState("");
    const [dataResume, setDataResume] = useState({});
    const [isEditing, setIsEditing] = useState(false);
    const [toast, setToast] = useState(null);

    const handleImageUpload = (e) => { //загрузка фото
        const file = e.target.files[0];
        if (file) {
            setImage(URL.createObjectURL(file));
            setPhotoFile(file); 
        }
    };

  const generatePDF = () => {
    // Добавляем проверку на Chrome
    const isChrome = /chrome/i.test(navigator.userAgent);
    
    if (isChrome) {
      // Для Chrome открываем в той же вкладке с параметром
      window.location.href = `/generate-resume-pdf/${dataResume.user_id}?chrome=1`;
    } else {
      // Для других браузеров стандартное поведение
      window.open(`/generate-resume-pdf/${dataResume.user_id}`, '_blank');
    }
  };

    useEffect(() => {
        fetch('/api/getResume.php', {
            method:"GET",
            credentials: "include"
        })
        .then((response) => {
            return response.json();
        })
        .then((data) => {
            if (data.status === 'true') {
                const resume = data.resume[0];
                setDataResume(resume);
                setDescription(resume.description || "");
            setIsEditing(true);
            }
        })

    }, []);

    function resumeForm(event){
        event.preventDefault();

        const form = event.target.closest('form');
        const resumeData = new FormData(form);

        resumeData.append("photo", photoFile); 
        resumeData.append("description", description);

        fetch(`/api/${isEditing ? 'updateResume' : 'createResume'}.php`,{
            method: "POST",
            credentials: "include",
            body: resumeData,
        })
        .then((response) => {
            return response.json();
        })
        .then((data) => {
            if (data.status === 'success') {
                setToast({ message: "Ваше резюме успешно сохранено", type: "success" });
              } else {
                setToast({ message: 'Ошибка: ' + data.message, type: "error" });
              }
          })
        .catch(() => {
            setToast({ message: 'Ошибка сервера', type: "error" });
          })

    }
    console.log(dataResume.photo_path);
    return(
        <main>
            <div className="resume__inner container">
                <h1 className="resume__title-pahe">Создать резюме</h1>
                {dataResume &&(
                <form action="" method="post" onSubmit={resumeForm} encType="multipart/form-data">
                    <div className="resume__body">
                        <div className="resume__img">
                            <img src={image ? image : ` http://r92676qx.beget.tech/${dataResume.photo_path}`} alt=""  className="resume__photo-width"/>
                            <label className="resume__buttin-img">
                                Загрузить фото
                                <input
                                type="file"
                                accept="image/*"
                                onChange={handleImageUpload}
                                style={{ display: "none" }}
                                name="photo"
                                />
                            </label>
                        </div>
                        <div className="resume__input">
                            <div className="createOffers__form-block">
                                <input
                                className="createOffers__form-block-input"
                                type="text"
                                placeholder="ФИО"
                                name="fullName"
                                defaultValue={dataResume.full_name}
                                />
                            </div>
                            <div className="createOffers__form-block">
                                <input
                                className="createOffers__form-block-input"
                                type="text"
                                placeholder="Желаемая должность"
                                name="desiredPosition"
                                defaultValue={dataResume.desired_position}
                                />
                            </div> 
                            <div className="createOffers__form-block">
                                    <input
                                    className="createOffers__form-block-input"
                                    type="text"
                                    placeholder="Город"
                                    name="city"
                                    defaultValue={dataResume.city}
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
                                    defaultValue={dataResume.phone}
                                    />
                                </div> 
                                <div className="createOffers__form-block">
                                    <input
                                    className="createOffers__form-block-input"
                                    type="email"
                                    placeholder="Почта"
                                    name="email"
                                    defaultValue={dataResume.email}
                                    />
                                </div> 
                                <div className="createOffers__form-block">
                                    <input
                                    className="createOffers__form-block-input"
                                    type="text"
                                    placeholder="Telegram"
                                    name="telegram"
                                    defaultValue={dataResume.telegram}
                                    />
                                </div> 
                                <div className="createOffers__form-block">
                                    <input
                                    className="createOffers__form-block-input"
                                    type="text"
                                    placeholder="Git"
                                    name="git"
                                    defaultValue={dataResume.git}
                                    />
                                </div> 
                            </div>
                            <select className="offers-filters__form-block-select" name="speciality" defaultValue={dataResume.speciality}>
                                <option value="">Специальность</option>
                                <option value="ИТ">ИТ</option>
                                <option value="Экономика">Экономика</option>
                                <option value="Юриспруденция">Юриспруденция</option>
                                <option value="Педагог">Педагог</option>
                            </select>
                        </div>
                    </div>
                    <div className="resume__end">
                        <div  data-color-mode="light" >
                            <MDEditor value={description} onChange={setDescription} />
                        </div>
                        <button className="resume__buttin-pdf" type="button" onClick={generatePDF}>Сгенерировать PDF</button>
                        <button className="resume__buttin-save" type="submit">Сохранить</button>
                    </div>
                </form>
                )}
                {toast && (
                        <Toast
                          message={toast.message}
                          type={toast.type}
                          onClose={() => setToast(null)}
                        />
                      )}
            </div>
        </main>
    )
}