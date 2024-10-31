import React from 'react';
import { Link } from 'react-router-dom';

const Navbar = () => {
  return (
    <nav className="navbar navbar-expand-lg navbar-light bg-light">
      <Link className="navbar-brand" to="/">Word App</Link>
      <div className="collapse navbar-collapse justify-content-center">
        <ul className="navbar-nav">
          <li className="nav-item">
            <Link className="nav-link" to="/words">Word List</Link>
          </li>
          <li className="nav-item">
            <Link className="nav-link" to="/random">Random Word</Link>
          </li>
        </ul>
      </div>
    </nav>
  );
};

export default Navbar;
