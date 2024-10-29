class Word {
  final String word;
  final int langOrigin;

  Word({required this.word, required this.langOrigin});

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      langOrigin: json['lang_origin'],
    );
  }
}
