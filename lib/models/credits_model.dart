// import 'package:flutter/material.dart';

class Credits {
  late int id;
  late List<Actor> cast;
  late List<Member> crew;

  Credits(
      {
        required this.id,
        required this.cast,
        required this.crew,
      });

  Credits.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    cast = json['cast'];
    crew = json['crew'];
  }

} //Credits

class Actor{
  late bool adult;
  int? gender; //or null
  late int id;
  late String knownForDepartment;
  late String name;
  late String originalName;
  late double popularity;
  String? profilePath; //or null
  late int castId;
  late String character;
  late String creditId;
  late int order;

  Actor({
    required this.adult,
    this.gender, //or null
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath, //or null
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity']/1;
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }



}
class Actors {
  List<Actor> items = [];

  Actors.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final Actor film = Actor.fromJsonMap(item);
      items.add(film);
    }
  }
}//Films


class Member{

  late bool adult;
  int? gender; //or null
  late int id;
  late String knownForDepartment;
  late String name;
  late String originalName;
  late double popularity;
  String? profilePath; //or null
  late String creditId;
  late String department;
  late String job;

  Member({
    required this.adult,
    this.gender, //or null
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath, //or null
    required this.creditId,
    required this.department,
    required this.job,
  });

  Member.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity']/1;
    profilePath = json['profile_path'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }
}//Member

class Staff{
  List<Member> items = [];

  Staff.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      final Member member = Member.fromJsonMap(item);
      items.add(member);
    }
  }
}//Staff
