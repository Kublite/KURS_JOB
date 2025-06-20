import React, { useState, useEffect, useRef } from 'react';
import { useParams } from 'react-router-dom';
import MDEditor from "@uiw/react-md-editor";
import html2pdf from 'html2pdf.js';

export default function ViewingResume({ generatePDF = false }) {
  const [resume, setResume] = useState(null);
  const [imageData, setImageData] = useState(null);
  const { id } = useParams();
  const pdfRef = useRef();
  const pdfGenerated = useRef(false);

  const convertImageToBase64 = (url) => {
    return new Promise((resolve) => {
      fetch(url)
        .then((res) => res.blob())
        .then((blob) => {
          const reader = new FileReader();
          reader.onloadend = () => {
            setImageData(reader.result);
            resolve(reader.result);
          };
          reader.readAsDataURL(blob);
        })
        .catch((err) => {
          console.error("Ошибка загрузки изображения:", err);
          resolve(null);
        });
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
      .then(async (data) => {
        if (data.status === 'true') {
          const res = data.resume[0];
          setResume(res);

          if (res.photo_path) {
            await convertImageToBase64(`http://r92676qx.beget.tech/${res.photo_path}`);
          }
        }
      });
  }, [id]);

  useEffect(() => {
    const generatePdf = async () => {
      if (!resume || !generatePDF || !pdfRef.current || pdfGenerated.current) return;
      pdfGenerated.current = true;

      await new Promise(resolve => setTimeout(resolve, 1000));

      const element = pdfRef.current;
      
      const opt = {
        margin: 10,
        filename: `${resume.full_name || 'resume'}.pdf`,
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { 
          scale: 2,
          useCORS: true,
          scrollY: 0,
          windowHeight: element.scrollHeight,
          logging: true,
          letterRendering: true,
          allowTaint: true
        },
        jsPDF: { 
          unit: 'mm', 
          format: 'a4', 
          orientation: 'portrait'
        },
        pagebreak: {
          mode: 'avoid-all',
          avoid: '.avoid-break'
        }
      };

      try {
        const isFirefox = navigator.userAgent.toLowerCase().includes('firefox');
        if (isFirefox) {
          await html2pdf()
            .set(opt)
            .from(element)
            .toPdf()
            .get('pdf')
            .then(pdf => pdf.output('dataurlnewwindow'));
        } else {
          await html2pdf().set(opt).from(element).save();
        }

        if (window.opener) window.close();
      } catch (error) {
        console.error('PDF generation error:', error);
      }
    };

    generatePdf();
  }, [resume, generatePDF]);

  return (
    <main>
      {resume && (
        <div ref={pdfRef} className="viewing-resume-container">
          <div className="resume-header avoid-break">
            <div className="resume-photo">
              {imageData ? (
                <img src={imageData} alt="Фото" className="resume-photo-img" />
              ) : (
                <div className="resume-photo-placeholder">Нет фото</div>
              )}
            </div>
            
            <div className="resume-personal-info">
              <h1 className="resume-name">{resume.full_name}</h1>
              <h2 className="resume-position">{resume.desired_position}</h2>
              <div className="resume-location">{resume.city}</div>
              <div className="resume-specialty">{resume.speciality || "Специальность"}</div>
            </div>
          </div>

          <div className="resume-section avoid-break">
            <h3>Контактная информация</h3>
            <ul className="resume-contacts">
              {resume.phone && <li>Телефон: {resume.phone}</li>}
              {resume.email && <li>Email: {resume.email}</li>}
              {resume.telegram && <li>Telegram: {resume.telegram}</li>}
              {resume.git && <li>Git: {resume.git}</li>}
            </ul>
          </div>

          <div className="resume-description avoid-break">
            <h3>О себе</h3>
            <div className="markdown-content">
              <MDEditor.Markdown source={resume.description} />
            </div>
          </div>
        </div>
      )}
    </main>
  );
}