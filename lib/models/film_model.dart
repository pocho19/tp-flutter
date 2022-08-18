import 'package:flutter/material.dart';

class Film {
  String? posterPath;
  late bool adult;
  late String overview;
  late String releaseDate;
  late List<int> genreIds;
  late int id;
  late String originalTitle;
  late String originalLanguage;
  late String title;
  String? backdropPath;
  late double popularity;
  late int voteCount;
  late bool video;
  late double voteAverage;

  Film(
      {this.posterPath,
      required this.adult,
      required this.overview,
      required this.releaseDate,
      required this.genreIds,
      required this.id,
      required this.originalTitle,
      required this.originalLanguage,
      required this.title,
      this.backdropPath,
      required this.popularity,
      required this.voteCount,
      required this.video,
      required this.voteAverage});

  Film.fromJsonMap(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    title = json['title'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  ImageProvider getPosterImg() {
    if (posterPath == null) {
      return const AssetImage('assets/images/no-image.jpg');
    } else {
      return NetworkImage('https://image.tmdb.org/t/p/w500/$posterPath');
    }
  }

  ImageProvider getBackDropImg() {
    if (backdropPath == null) {
      return const AssetImage('assets/images/cine.png');
    } else {
      return NetworkImage('https://image.tmdb.org/t/p/w500/$backdropPath');
    }
  }
} //Film

class Films {
  List<Film> items = [];

  Films.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final Film film = Film.fromJsonMap(item);
      items.add(film);
    }
  }
}//Films
