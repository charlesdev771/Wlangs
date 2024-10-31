import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wlangs/screenabout.dart';
import 'screendeveloper.dart';
import 'dart:convert';
import 'word_model.dart'; // Certifique-se de que este arquivo existe e contém a definição da classe Word
import 'dart:math';

class WordScreen extends StatefulWidget {
  @override
  _WordScreenState createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  late Future<List<Word>> wordList;
  List<Word>? words;
  int? selectedLangOrigin;
  String? randomWord;
  String? randomTranslation; // Adicionando a variável para armazenar a tradução

  @override
  void initState() {
    super.initState();
    wordList = fetchWords(); // Carrega a lista de palavras da API
  }

  Future<List<Word>> fetchWords({int? langOrigin}) async {
    String url = "http://192.168.1.73:8000/api/words/";
    if (langOrigin != null) {
      url += "?lang_origin=$langOrigin"; // Adiciona o filtro de idioma
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      words = jsonResponse.map((data) => Word.fromJson(data)).toList();
      return words!;
    } else {
      throw Exception('Failed to find words');
    }
  }

  void showRandomWord() {
    if (words != null && words!.isNotEmpty) {
      final random = Random();
      int randomIndex = random.nextInt(words!.length); // Gera um índice aleatório
      setState(() {
        randomWord = words![randomIndex].word; // Armazena a palavra aleatória
        randomTranslation = words![randomIndex].translation; // Armazena a tradução correspondente
      });
    } else {
      // Se a lista de palavras estiver vazia ou nula
      setState(() {
        randomWord = null; // Garante que randomWord seja nulo
        randomTranslation = null; // Garante que randomTranslation seja nulo
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 137, 104, 255),
          title: Center(
            child: Text(
              "Wlangs",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Home"),
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/html.png', // Caminho da imagem da aba "Word List"
                      width: 12,
                      height: 12,
                    ),
                    Text("Project"),
                  ],
                ),
              ),
                            Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/i.png', // Caminho da imagem da aba "Word List"
                      width: 12,
                      height: 12,
                    ),
                    Text("Developer"),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 150, 120, 255),
        body: TabBarView(
          children: [
            screenList(),
            screenabout(),
            screendeveloper(),
          ],
        ),
      ),
    );
  }

  Widget screenList() {
    return FutureBuilder<List<Word>>(
      future: wordList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No words :('));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 200, // Largura da imagem
                    height: 150, // Altura da imagem
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Bordas arredondadas
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/lang.jpg', // Caminho da sua imagem
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Primeiro DropdownButton
                  DropdownButton<int>(
                    hint: Text("Select Your Language: "),
                    value: selectedLangOrigin,
                    onChanged: (newValue) {
                      setState(() {
                        selectedLangOrigin = newValue;
                        wordList = fetchWords(langOrigin: newValue); // Atualiza a lista de palavras
                      });
                    },
                    items: [
                      DropdownMenuItem(value: 1, child: Text("English")),
                      DropdownMenuItem(value: 2, child: Text("Spanish")),
                      DropdownMenuItem(value: 3, child: Text("Italian")),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: showRandomWord, // Ação ao pressionar o botão
                    child: Text("Show Random Word"),
                  ),
                  SizedBox(height: 20),
                  // Mostra a palavra aleatória e sua tradução se existirem
                  if (randomWord != null && randomTranslation != null) 
                    Text(
                      "$randomWord, the significant is: $randomTranslation",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  // Aqui você pode adicionar a lista de palavras filtradas
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final word = snapshot.data![index];
                        return ListTile(
                          title: Text(word.word),
                          subtitle: Text(word.translation), // Exibe a tradução na lista
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
