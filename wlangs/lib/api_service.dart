import 'dart:convert';
import 'package:http/http.dart' as http;
import 'word_model.dart';
import 'dart:io';
class ApiService 
{

  final String apiUrl = "http://192.168.1.73:8000/api/words/"; //Your api and breakpoints

  Future<List<Word>> fetchWords() async {

    try 
    {
      
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200)
      {
        
        final List<dynamic> wordJson = json.decode(response.body);
        return wordJson.map<Word>((dynamic json) => Word.fromJson(json)).toList();
      
      }

      else
      {

        throw Exception('Failed to load words :( ${response.statusCode}');
      
      }

    
    }

    catch (e) 
    {

      throw Exception('Error fetching words...');
      print('Error: $e');

    }

  }

}