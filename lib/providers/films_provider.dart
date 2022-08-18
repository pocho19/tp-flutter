import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/film_model.dart';
import 'api_key_personal.dart';

class FilmsProvider {
  final String _apiKey = apiKeyPersonal;
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';
  final String _region = 'AR';

  Future<List<Film>> getFromCinemas() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'region': _region,
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final films = Films.fromJsonList(decodedData['results']);
    return films.items;
  }
}
