import 'package:clase06pocho/models/credits_model.dart';
import 'package:flutter/material.dart';

import '../models/film_model.dart';
import '../providers/credits_provider.dart';
import '../widgets/card_credits.dart';
// import '../models/film_model.dart';
// import '../widgets/card_film.dart';

/*
  scaffold
    appbar
    body
      column
        img
        row
          img
          card
          column
        text
 */

class FilmCredits extends StatelessWidget {

  FilmCredits(
      {
        Key? key,
        required this.film,
      }) : super(key: key);
  final Film film;
  late final creditsProvider = CreditsProvider();

  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Creditos:  $film.name '),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          SizedBox(
            height: 40,
            child: Container(
              color: Colors.red,
              child: Text(
                "name: $film.name /",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),

              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Container(
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 500,
            child: _creditsCard(context),
          )
        ],
      ),
    );
  }
  Widget _creditsCard(BuildContext context) {
    return FutureBuilder(
      future: creditsProvider.getCredits(film.id),
      builder: (BuildContext context, AsyncSnapshot<Credits> snapshot) {
        if (snapshot.hasData) {
          return CardCredits(credits: snapshot.data!);
        } else {
          return const SizedBox(
              height: 500.0,
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
