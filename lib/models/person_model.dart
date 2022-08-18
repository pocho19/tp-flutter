
import 'package:flutter/material.dart';

class Person {
    late DateTime? birthday;
    late String knownForDepartment;
    late DateTime? deathDay;
    late int id;
    late String name;
    late List<String> alsoKnownAs;
    late int gender;
    late String biography;
    late double popularity;
    late String? placeOfBirth;
    late String? profilePath;
    late bool adult;
    late String imdbId;
    late String? homepage;
    Person({
        this.birthday,
        required this.knownForDepartment,
        this.deathDay,
        required this.id,
        required this.name,
        required this.alsoKnownAs,
        required this.gender,
        required this.biography,
        required this.popularity,
        this.placeOfBirth,
        this.profilePath,
        required this.adult,
        required this.imdbId,
        this.homepage,
    });
    Person.fromJsonMap(Map<String, dynamic> json) {
      birthday = json['birthday'];
      knownForDepartment = json['known_for_department'];
      deathDay = json['deathday'];
      id = json['id'];
      name = json['name'];
      alsoKnownAs = json['also_known_as'];
      gender = json['gender'];
      biography = json['biography'];
      popularity = json['popularity'];
      placeOfBirth = json['place_of_birth'];
      profilePath = json['profile_path'];
      adult = json['adult'];
      imdbId = json['imdb_id'];
      homepage = json['homepage'];
    }
    ImageProvider getProfileImg() {
    if (profilePath == null) {
      return const AssetImage('assets/images/user.png');
    } else {
      return NetworkImage('https://image.tmdb.org/t/p/w500/$profilePath');
    }
  }
}
class People {
  List<Person> items = [];

  People.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final Person person = Person.fromJsonMap(item);
      items.add(person);
    }
  }
  People.addPerson(Person p){
    //to do rechazar id duplicado
    items.add(p);
  }
}