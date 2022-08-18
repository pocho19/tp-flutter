import 'package:flutter/material.dart';

import '../models/film_model.dart';

class CardFilm extends StatelessWidget {
  const CardFilm({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        elevation: 5.0,
        color: Colors.teal.shade50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('RATING : ${film.voteAverage.toString()}'),
              Row(
                children: [
                  Container(
                    height: 5.0,
                    width: film.voteAverage * 10,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 5.0,
                    width: 100 - film.voteAverage * 10,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text('Titulo Original: ${film.originalTitle}'),
              const SizedBox(height: 8),
              Text('Fecha de Lanzamiento: ${film.releaseDate}'),
              const SizedBox(height: 8),
              Text('Adultos: ' + (film.adult ? 'SI' : 'NO'),),
              const SizedBox(height: 8),
              const Text("Creditos: ...link..."),
            ],
          ),
        ),
      ),
    );
  }
}
