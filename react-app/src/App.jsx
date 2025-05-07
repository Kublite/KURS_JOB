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
              <Route path="/TableOffers" element={<TableOffers />} />
              <Route path="/OllOffers" element={<OllOffers />} />
              <Route path="/TableOffers/CreateOffers" element={<CreateOffers />} />
              <Route path="/TableOffers/EditOffers/:id" element={<EditOffers />} />
              <Route path="/OllOffers/PageOffer/:id" element={<PageOffer />} />
            </Routes>
          <Footer />
        </Router>
      )
    }
  }
}
