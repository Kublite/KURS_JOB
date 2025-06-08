import React, { useState, useEffect } from "react";
import MDEditor from "@uiw/react-md-editor";

export default function ViewingPage() {
  const page = window.location.pathname.split('/').pop();
  const [content, setContent] = useState('');

  useEffect(() => {
    const params = new URLSearchParams();
    params.append('page', page);

    fetch('/api/getPage.php', {
      method: "POST",
      credentials: "include",
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
      },
      body: params.toString(),
    })
    .then(res => {
      if (!res.ok) throw new Error('Network response was not ok');
      return res.json();
    })
    .then(data => {
      setContent(data.page.content || "");
      console.log(data.page.content || "");
    })
    .catch(() => {
      alert("Ошибка при подключении к серверу");
    });
  }, [page]);

  return (
    <main>
        <div className="container">
            <div data-color-mode="light">
                <MDEditor.Markdown source={content} />
            </div>
        </div>
    </main>
  );
}