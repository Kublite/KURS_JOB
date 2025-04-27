import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import useAuth from './scripts/auth';
import { Navigate } from 'react-router-dom';
import Header from './components/Header';
import Footer from './components/Footer';
import Registration from './pages/Registration';
import Login from './pages/Login';

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
              <Route path="/users" element={<Registration /> } />
              <Route path="/login" element={<Navigate to="/" replace />} />
            </Routes>
          <Footer />
        </Router>
      )
    }
  }
}
