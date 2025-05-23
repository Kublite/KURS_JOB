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
      return(
        <Router>
          <Header />
            <Routes>
              <Route path="/" element={<main/>}/>
              <Route path="/users" element={<Registration /> } />
              <Route path="/login" element={<Navigate to="/" replace />} />
              <Route path="/Resume" element={<Resume />} />
              <Route path="/TableOffers" element={<TableOffers />} />
              <Route path="/OllOffers" element={<OllOffers />} />
              <Route path="/TableOffers/CreateOffers" element={<CreateOffers />} />
              <Route path="/TableOffers/EditOffers/:id" element={<EditOffers />} />
              <Route path="/OllOffers/PageOffer/:id" element={<PageOffer />} />
              <Route path="/ViewingResume/:id" element={<ViewingResume />} />
              <Route path="/ResponseUsers" element={<ResponseUsers />} />
              <Route path="/AnswersHr" element={<AnswersHr />} />
              <Route path="/CreateMessage" element={<CreateMessage />} />
              <Route path="/TableMessage" element={<TableMessage />} />
              <Route path="/TableMessage/Message/:id" element={<Message />} />
            </Routes>
          <Footer />
        </Router>
      )
    }
  }
}
