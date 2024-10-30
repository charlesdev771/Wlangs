import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_service.dart';
import 'word_model.dart';

class WordScreen extends StatefulWidget {
  @override
  _WordScreenState createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> 
{

  late Future<List<Word>> wordList;
  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;

  @override
  void initState() 
  {

    super.initState();
    wordList = fetchWords(); // Carrega a lista de palavras da API
  
  }

  Future<List<Word>> fetchWords() async 
  {

    final response = await http.get(Uri.parse("http://192.168.1.73:8000/api/words/")); // URL da API

    if (response.statusCode == 200) 
    {
     
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Word.fromJson(data)).toList();
    
    } 
    else 
    {

      throw Exception('Failed in find words');
    
    }
  
  }

  @override
  Widget build(BuildContext context) 
  {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 120, 255),
        title: Center(
        child:   Text(
          "Wlangs",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
      ),
      body: FutureBuilder<List<Word>>(
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
              child: 
              Center(child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Primeiro DropdownButton
                  DropdownButton<String>(
                    hint: Text("Select Your language: "),
                    value: selectedValue1,
                    onChanged: (newValue) {
                      setState(() {
                        selectedValue1 = newValue;
                      });
                    },
                    items: snapshot.data!
                        .map((word) => DropdownMenuItem<String>(
                              value: word.word,
                              child: Text(word.word),
                            ))
                        .toList(),
                  ),
             
                  
                  SizedBox(height: 20),

                Text("Your in italian word is: ciao that the significant is: hello!")],
              ),
            )
            );
          }
        },
      ),
    );
  }
}
