import 'dart:convert';
import 'package:http/http.dart' as http;
import 'word_model.dart';
import 'dart:io';
class ApiService 
{

  Future<List<Word>> fetchWords({String? langOrigin}) async {
  String url = "http://192.168.1.73:8000/api/words/";
  if (langOrigin != null) {
    url += "?lang_origin=$langOrigin";
  }
  
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Word.fromJson(data)).toList();
  } else {
    throw Exception('Failed to find words');
  }
}
}