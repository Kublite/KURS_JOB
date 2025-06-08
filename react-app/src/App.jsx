import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import useAuth from './scripts/auth';
import { Navigate } from 'react-router-dom';
import Header from './components/header/Header';
import Footer from './components/Footer';
import Registration from './pages/Registration';
import Login from './pages/Login';
import CreateOffers from './pages/CreateOffers';
import TableOffers from './pages/TableOffers';
import EditOffers from './pages/EditOffers';
import OllOffers from './pages/OllOffers';
import PageOffer from './pages/PageOffer';
import Resume from './pages/Resume';
import ResponseUsers from './pages/ResponseUsers';
import ViewingResume from './pages/ViewingResume';
import AnswersHr from './pages/AnswersHr';
import CreateMessage from './pages/CreateMessage';
import TableMessage from './pages/TableMessage';
import Message from './pages/Message';
import NotFound from './pages/NotFound';
import Breadcrumbs from "./components/Breadcrumbs";
import SelectPage from "./pages/SelectPage";
import EditPage from "./pages/EditPage";
import ViewingPage from "./pages/ViewingPage";

export default function App(){
  const { loading, authenticated, role } = useAuth();
  if(loading){return(<div>Загрузка...</div>)}
  else {
    if(!authenticated){
      return (
        <Router>
          <Routes>
            <Route path="/Login" element={<Login />} />
            <Route path="*" element={<Navigate to="/login" replace />} />
          </Routes>
        </Router>
      );
    }
    else{
      if(role=='admin'){
        return(
        <Router>
          <Header />
          <Breadcrumbs />
            <Routes>
              <Route path="/Registration" element={<Registration /> } />
              <Route path="/login" element={<Navigate to="/" replace />} />
              <Route path="/OllOffers" element={<OllOffers />} />
              <Route path="/OllOffers/PageOffer/:id" element={<PageOffer />} />
              <Route path="/ViewingResume/:id" element={<ViewingResume />} />
              <Route path="/TableMessage" element={<TableMessage />} />
              <Route path="/TableMessage/Message/:id" element={<Message />} />
              <Route path="/" element={<SelectPage />} />
              <Route path="/CareerCenter" element={<EditPage />} />
              <Route path="/News" element={<EditPage />} />
              <Route path="/Praktika" element={<EditPage />} />
              <Route path="/Rabotodatelyam" element={<EditPage />} />
              <Route path="*" element={<NotFound />} />
            </Routes>
          <Footer />
        </Router>
      )}
      else if(role=='HR'){
        return(
        <Router>
          <Header />
          <Breadcrumbs />
            <Routes>
              <Route path="/" element={<ViewingPage/>}/>
              <Route path="/login" element={<Navigate to="/" replace />} />
              <Route path="/TableOffers" element={<TableOffers />} />
              <Route path="/OllOffers" element={<OllOffers />} />
              <Route path="/TableOffers/CreateOffers" element={<CreateOffers />} />
              <Route path="/TableOffers/EditOffers/:id" element={<EditOffers />} />
              <Route path="/OllOffers/PageOffer/:id" element={<PageOffer />} />
              <Route path="/ViewingResume/:id" element={<ViewingResume />} />
              <Route path="/ResponseUsers" element={<ResponseUsers />} />
              <Route path="/CreateMessage" element={<CreateMessage />} />
              <Route path="/generate-resume-pdf/:id" element={<ViewingResume generatePDF={true} />} />

              <Route path="/CareerCenter" element={<ViewingPage />} />
              <Route path="/News" element={<ViewingPage />} />
              <Route path="/Praktika" element={<ViewingPage />} />
              <Route path="/Rabotodatelyam" element={<ViewingPage />} />

              <Route path="*" element={<NotFound />} />
            </Routes>
          <Footer />
        </Router>
      )}
      else if(role=='student'){
        return(
        <Router>
          <Header />
          <Breadcrumbs />
            <Routes>
              <Route path="/" element={<ViewingPage/>}/>
              <Route path="/login" element={<Navigate to="/" replace />} />
              <Route path="/Resume" element={<Resume />} />
              <Route path="/OllOffers" element={<OllOffers />} />
              <Route path="/OllOffers/PageOffer/:id" element={<PageOffer />} />
              <Route path="/AnswersHr" element={<AnswersHr />} />
              <Route path="/CreateMessage" element={<CreateMessage />} />
              <Route path="/generate-resume-pdf/:id" element={<ViewingResume generatePDF={true} />} />

              <Route path="/News" element={<ViewingPage />} />
              <Route path="/Praktika" element={<ViewingPage />} />
              <Route path="/Rabotodatelyam" element={<ViewingPage />} />

              <Route path="*" element={<NotFound />} />
            </Routes>
          <Footer />
        </Router>
      )}
    }
  }
}
