import 'package:clase06pocho/pages/film_credits.dart';
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
      body: Column(
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
          SizedBox(
            width: _screen.width,
            height: _screen.height * 0.3,
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
                  height: 10,
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
          SizedBox(
            child: Text(
              'Descripcion: ${film.overview}',
            ),
          ),
          SizedBox(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilmCredits(
                      film: film,
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.deepPurple,
                child: const Text('button'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
