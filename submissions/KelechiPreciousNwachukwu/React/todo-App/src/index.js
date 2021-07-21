import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';

const TASKS = [
	
];

ReactDOM.render(
  <React.StrictMode>
    <App tasks = {TASKS} />
  </React.StrictMode>,
  document.getElementById('root')
);