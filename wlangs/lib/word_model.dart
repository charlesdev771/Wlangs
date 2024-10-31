// Adicione um campo de tradução na classe Word
class Word {
  final String word;
  final String translation; // Adicione o campo de tradução
  final int langOrigin;

  Word({required this.word, required this.translation, required this.langOrigin});

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      translation: json['translation'], // Inclua a tradução aqui
      langOrigin: json['lang_origin'],
    );
  }
}
