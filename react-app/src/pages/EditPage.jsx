import React, { useState, useEffect } from "react";
import MDEditor from "@uiw/react-md-editor";
import Toast from "../components/Toast";

export default function EditPage() {
  const [toast, setToast] = useState(null);
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
          setToast({ message: "Ошибка загрузки данных", type: "error" });
        }
      })
      .catch(() => {
        setToast({ message: "Ошибка при подключении к серверу", type: "error" });
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
          setToast({ message: "Контент успешно сохранён", type: "success" });
        } else {
          setToast({ message: "Ошибка при сохранении", type: "error" });
        }
      })
      .catch(() =>
      setToast({ message: "Ошибка соединения с сервером", type: "error" }));
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
      {toast && (
              <Toast
                message={toast.message}
                type={toast.type}
                onClose={() => setToast(null)}
              />
            )}
    </main>
  );
}