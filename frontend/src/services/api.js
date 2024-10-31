import axios from 'axios';

const api = axios.create({
  baseURL: 'http://192.168.1.73:8000/api',
});

export const getWords = async (langOrigin) => {
  const response = await api.get(`/words?lang_origin=${langOrigin}`);
  return response.data;
};

export const getRandomWord = async () => {
  const response = await api.get('/words/random');
  return response.data;
};

export default api;
