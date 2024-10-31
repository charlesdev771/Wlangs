import React, { useState, useEffect } from 'react';
import { getWords } from '../services/api';

const WordList = () => {
  const [words, setWords] = useState([]);
  const [langOrigin, setLangOrigin] = useState('');

  useEffect(() => {
    if (langOrigin) {
      getWords(langOrigin).then(setWords);
    }
  }, [langOrigin]);

  return (
    <div className="container text-center">
      <h2 className="mt-4">Word List</h2>
      <select className="form-control mt-3" onChange={(e) => setLangOrigin(e.target.value)}>
        <option value="">Select Language</option>
        <option value="1">English</option>
        <option value="2">Spanish</option>
        <option value="3">Italian</option>
      </select>
      <ul className="list-group mt-3">
        {words.map((word) => (
          <li key={word.id} className="list-group-item">{word.word}</li>
        ))}
      </ul>
    </div>
  );
};

export default WordList;
