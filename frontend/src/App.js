// src/App.js
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Container, Row, Col, Form, Button, Card } from 'react-bootstrap';

const API_BASE_URL = "http://127.0.0.1:8000/api"; // URL base da API

function App() {
  const [languages, setLanguages] = useState([]);
  const [words, setWords] = useState([]);
  const [selectedLanguage, setSelectedLanguage] = useState('');

  // Carrega a lista de idiomas ao montar o componente
  useEffect(() => {
    axios.get(`${API_BASE_URL}/languages/`)
      .then(response => {
        setLanguages(response.data);
      })
      .catch(error => console.error("Error in load languages:", error));
  }, []);

  // Função para buscar palavras por idioma
  const fetchWords = (langId) => {
    axios.get(`${API_BASE_URL}/languages`)
      .then(response => {
        setWords(response.data);
      })
      .catch(error => console.error("Error in loads words:", error));
  };

  return (
    <Container className="d-flex flex-column align-items-center mt-5">
      <h2 className="text-center mb-4">WLangs</h2>
      <Form.Group as={Row} controlId="languageSelect">
        <Col sm="0">
          <Button variant="primary" onClick={() => fetchWords(selectedLanguage)}>Show words!</Button>
        </Col>
      </Form.Group>

      <Row className="mt-5">
        {words.map(word => (
          <Col md="4" key={word.id} className="mb-3">
            <Card>
              <Card.Body>
                <Card.Title>{word.word}</Card.Title>
                <Card.Text>Translation: {word.translation}</Card.Text>
              </Card.Body>
            </Card>
          </Col>
        ))}
      </Row>
    </Container>
  );
}

export default App;
