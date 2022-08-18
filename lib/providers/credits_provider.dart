import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/credits_model.dart';
import 'api_key_personal.dart';

//https://api.themoviedb.org/3/movie/156/credits?api_key=9f6284643807b183c2dc3763ca5b4ccd&language=en-US

class CreditsProvider {
  final String _url = 'api.themoviedb.org';
  final String _apiKey = apiKeyPersonal;
  final String _language = 'es-ES';

  Future<Credits> getCredits(int id) async {
    final url = Uri.https(_url, '3/movie/$id/credits', {
      'api_key': _apiKey,
      'language': _language,
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final credits = Credits.fromJsonMap(decodedData['results']);
    return credits;
  }
}
