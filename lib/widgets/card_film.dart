import 'package:flutter/material.dart';

import '../models/film_model.dart';
import '../pages/film_credits.dart';

class CardFilm extends StatelessWidget {
  const CardFilm({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              Text('RATING : ${film.voteAverage.toString()}/10'),
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
              Row(
                children: [
                  const Text("Creditos: "),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 20,
                          width: 20,
                          color: Colors.blue,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FilmCredits(
                                    film: film,
                                  ),
                                ),
                              );
                              },
                            child: const Text(
                              '+',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
