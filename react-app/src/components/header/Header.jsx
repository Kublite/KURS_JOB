import React from 'react';
import { useState } from 'react';
import HeaderAdmin from './HeaderAdmin';
import HeaderHR from './HeaderHR';
import HeaderStudent from './HeaderStudent';
import useAuth from '../../scripts/auth';

export default function Header(){
  const [isMobileMenuOpen, setMobileMenuOpen]=useState(false);
  const [isClosing, setIsClosing]=useState(false);
  const [isAnimatingIn, setAnimatingIn] = useState(false);

  const { loading, authenticated, role } = useAuth();

  let MenuComponent = null;
  if(role=='admin'){MenuComponent =HeaderAdmin}
  else if(role=='HR'){MenuComponent =HeaderHR}
  else if(role=='student'){MenuComponent =HeaderStudent}

  const openMenu=()=>{
    setMobileMenuOpen(true);
    setTimeout(() => {
      setAnimatingIn(true);
    }, 0);
  }

  const closeMenu=()=>{
    setIsClosing(true);
    setAnimatingIn(false);
    setTimeout(() => {
      setMobileMenuOpen(false);
      setIsClosing(false);
    }, 300);
  }

    return(
        <>
          <header className ="header">
            <div className ="header__inner container">
              <a href="/" className ="header__logo logo">
                <img
                  src="../../public/img/logo-muiv-mini.svg"
                  alt="MUIV"
                  className ="logo__image"
                  width="80"
                  height="80"
                  loading="lazy"
                />
              </a>
              <nav className ="header__menu hidden-mobile">
              {MenuComponent && <MenuComponent />}
              </nav>
              <button
                className="button__burger-button burger-button visible-mobile"
                type="button"
                onClick={openMenu}
              >
                <span className="visually-hidden">open nav menu</span>
              </button>
            </div>
          </header>

          {isMobileMenuOpen && (
            <div className={`mobile-overlay visible-mobile ${isAnimatingIn ? 'slide-in' : ''} ${isClosing ? 'slide-out' : ''}`}>
              <div className="mobile-overlay__close-button-wraper">
                <button
                  className="mobile-overlay__close-button cross-button"
                  type="button"
                  onClick={closeMenu}
                >
                  <span className="visually-hidden">Close nav menu</span>
                </button>
              </div>
              <div className ="mobile-overlay__body">
              {MenuComponent && <MenuComponent />}
              </div>
            </div>
          )}
          </>
    )}
