
import 'package:flutter/material.dart';
import '../models/film_model.dart';
import '../widgets/card_film.dart';

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

class FilmDetail extends StatelessWidget {
  const FilmDetail({Key? key, required this.film}) : super(key: key);
  final Film film;
  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle pelicula: ${film.title} '),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: _screen.width,
            height: _screen.height * 0.4,
            child: FadeInImage(
              image: film.getBackDropImg(),
              placeholder: const AssetImage('assets/images/no-image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: _screen.width,
            height: _screen.height * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    child: FadeInImage(
                      image: film.getPosterImg(),
                      placeholder: const AssetImage('assets/images/no-image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    child: CardFilm(
                      film: film,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                '  ${film.overview}',
              ),
            ),
          ),
          Container(

          ),
        ],
      ),
    );
  }
}
