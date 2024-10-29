import 'package:flutter/material.dart';
import 'api_service.dart';
import 'word_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WordListScreen(),
    );
  }
}

class WordListScreen extends StatefulWidget {
  @override
  _WordListScreenState createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Word>> wordList;

  @override
  void initState() {
    super.initState();
    wordList = apiService.fetchWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Word List')),
      body: FutureBuilder<List<Word>>(
        future: wordList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No words found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final word = snapshot.data![index];
                return ListTile(
                  title: Text(word.word),
                  subtitle: Text('Language Origin ID: ${word.langOrigin}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
