import React, {useState, useEffect} from 'react';
import { Link } from 'react-router-dom';
import { useParams } from 'react-router-dom';
import MDEditor from "@uiw/react-md-editor";
import Toast from "../components/Toast";

export default function PageOffer(){
    const [offer, setOffer] = useState([]);
    const { id } = useParams();
    const [toast, setToast] = useState(null);

     useEffect(() => {
        fetch("/api/editOffer.php", {
            method: 'POST',
            credentials: 'include',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: `offer_id=${id}`,
        })
        .then((response) => response.json())
        .then((data) => {
            if (data.status === 'true') {
            setOffer(data.offers);
            console.log(data.offers);
            }
        })
        .catch((error) => {
            console.error("Ошибка открытия:", error);
        });
    }, []);

    useEffect(() => {
        fetch("/api/addView.php", {
          method: "POST",
          credentials: "include",
          headers: { "Content-Type": "application/x-www-form-urlencoded" },
          body: `offer_id=${id}`,
        });
      }, []);

    function response(){

        fetch("/api/response.php",{
            method: 'POST',
            credentials: 'include',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: `offer_id=${id}`,
        })
        .then((response) => response.json())
        .then((data) => {
            if (data.status === 'success') { 
                setToast({ message: "Резюме отправлено", type: "success" });
            } else {
              setToast({ message: data.message, type: "error" });
            }
        })
        .catch((error) => {
            console.error("Ошибка открытия:", error);
        });
    }

    return(
        <main>
            <div>
            {offer.map((offer) => (
                <div key={offer.id} className="page-offer__inner container" data-color-mode="light">
                    <MDEditor.Markdown source={offer.description} />
                    <div className="pageOffer__container-button">
                        <Link to="/OllOffers"  className="pageOffer__back">Назад</Link>
                        <button className="pageOffer__response" onClick={response}>Откликнуться</button>
                    </div>
                </div>
                ))}
            </div>
            {toast && (
                    <Toast
                      message={toast.message}
                      type={toast.type}
                      onClose={() => setToast(null)}
                    />
                  )}
        </main>
    )
}