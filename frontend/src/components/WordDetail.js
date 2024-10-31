import React, { useState } from 'react';
import { getRandomWord } from '../services/api';

const WordDetail = () => {

  const [word, setWord] = useState(null);

  const fetchRandomWord = () => {
    getRandomWord().then(setWord);
  
  };

  return (
    <div className="container text-center">
      <h2 className="mt-4">Random Word</h2>
      <button className="btn btn-primary mt-3" onClick={fetchRandomWord}>
        Show Random Word
      </button>
      {word && (
        <div className="mt-4">
          <h3>Word: {word.word}</h3>
          <p>Translation: {word.translation}</p>
        </div>
      )}
    </div>
  );
};

export default WordDetail;
