import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/person_model.dart';
import 'api_key_personal.dart';

//https://api.themoviedb.org/3/person/2?api_key=9f6284643807b183c2dc3763ca5b4ccd&language=es-ES

class PersonProvider {
  final String _apiKey = apiKeyPersonal;
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';

  Future<Person> getPersonDetail(int personId) async {
    final url = Uri.https(_url, '3/person/$personId', {
      'api_key': _apiKey,
      'language': _language,
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final person = Person.fromJsonMap(decodedData['results']);
    return person;
  }
}
