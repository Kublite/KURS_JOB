import React, { useState, useEffect, useRef } from 'react';
import { useParams } from 'react-router-dom';
import MDEditor from "@uiw/react-md-editor";
import html2pdf from 'html2pdf.js';

export default function ViewingResume({ generatePDF = false }) {
  const [resume, setResume] = useState(null);
  const [imageData, setImageData] = useState(null); // base64
  const { id } = useParams();
  const pdfRef = useRef();

  // Конвертируем картинку в base64
  const convertImageToBase64 = (url) => {
    fetch(url)
      .then((res) => res.blob())
      .then((blob) => {
        const reader = new FileReader();
        reader.onloadend = () => {
          setImageData(reader.result);
        };
        reader.readAsDataURL(blob);
      })
      .catch((err) => {
        console.error("Ошибка загрузки изображения:", err);
      });
  };

  useEffect(() => {
    fetch("/api/getResume.php", {
      method: 'POST',
      credentials: 'include',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: `user_id=${id}`,
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.status === 'true') {
          const res = data.resume[0];
          setResume(res);

          // Загружаем фото
          if (res.photo_path) {
            convertImageToBase64(`http://localhost/${res.photo_path}`);
            console.log("Загружаю картинку по:", `http://localhost/${res.photo_path}`);
          }
        }
      });
  }, [id]);

  useEffect(() => {
    if (resume && generatePDF && pdfRef.current) {
      setTimeout(() => {
        html2pdf()
          .set({
            filename: 'resume.pdf',
            html2canvas: { useCORS: true, scale: 2 }
          })
          .from(pdfRef.current)
          .save()
          .then(() => window.close());
      }, 1000);
    }
  }, [resume, imageData, generatePDF]);

  return (
    <main>
      {resume && (
        <div ref={pdfRef} className="viewing-resume__inner container" data-color-mode="light">
          <div className="viewing-resume__body">
            <div className="viewing-resume__img">
              {imageData ? (
                <img src={imageData} alt="Фото" className="viewing-resume__photo-width" />
              ) : (
                <p>Загрузка изображения...</p>
              )}
            </div>
            <ul className="viewing-resume__contact-list">
              <h3>Контактная информация</h3>
              <li>{resume.phone}</li>
              <li>{resume.email}</li>
              <li>{resume.telegram}</li>
              <li>{resume.git}</li>
            </ul>
            <div className="viewing-resume__info">
              <div>{resume.full_name}</div>
              <div>{resume.desired_position}</div>
              <div>{resume.city}</div>
              <div>{resume.speciality || "Специальность"}</div>
            </div>
          </div>
          <MDEditor.Markdown source={resume.description} />
        </div>
      )}
    </main>
  );
}