import React, { useState, useEffect } from "react";
import MDEditor from "@uiw/react-md-editor";

export default function EditPage() {
  const [content, setContent] = useState("");
  const [isLoaded, setIsLoaded] = useState(false);
  const page = window.location.pathname.split('/').pop();

  // Загрузка контента при монтировании
  useEffect(() => {
    const formData = new FormData();
    formData.append("page", page);

    fetch('/api/getPage.php', {
      method: "POST",
      credentials: "include",
      body: formData,
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.status === 'true') {
          setContent(data.page.content || "");
          setIsLoaded(true);
        } else {
          alert("Ошибка загрузки данных");
        }
      })
      .catch(() => {
        alert("Ошибка при подключении к серверу");
      });
  }, [page]);

  // Сохранение изменений
  const handleSave = (event) => {
    event.preventDefault();

    const formData = new FormData();
    formData.append("page", page);
    formData.append("content", content);

    fetch("/api/updatePage.php", {
      method: "POST",
      credentials: "include",
      body: formData,
    })
      .then(res => res.json())
      .then((data) => {
        if (data.status === 'success') {
          alert("Контент успешно сохранён");
        } else {
          alert("Ошибка при сохранении");
        }
      })
      .catch(() => alert("Ошибка соединения с сервером"));
  };

  return (
    <main className="edit-page container">
      <h1 className="edit-page__title">Редактирование: </h1>
      {isLoaded && (
        <form onSubmit={handleSave}>
          <div data-color-mode="light"  className="edit-page__content">
            <MDEditor value={content} onChange={setContent} />
          </div>
          <button type="submit" className="edit-page__save-button">Сохранить</button>
        </form>
      )}
    </main>
  );
}