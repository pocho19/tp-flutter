//hago los import
import 'package:flutter/material.dart';
//El switch show indica que solo este disponible eluna parte de la libreria.
//en este caso, del paquete io, solamente estara visible Platform y del paquete
//foundation solo kIsWeb


import '../models/film_model.dart';
import '../providers/films_provider.dart';
import '../widgets/card_swiper.dart';

class HomePage extends StatelessWidget {
  late final peliculasProvider = FilmsProvider();
  late final List<String> images;
  HomePage({Key? key}) : super(key: key);

//Método build, se ejecuta cada vez que se genera el widget
  @override
  Widget build(BuildContext context) {
//Mediaquery brinda información sobre el dispositivo fisico
//como el tamaño de la pantalla (el que usamos aca), pero tambien cosas
//como orientación, brillo de la pantalla, propiedades de las Fonts y mas.
    final Size _screen = MediaQuery.of(context).size;

//Observen el return. El método build devuelve siempre un widget
//Que se encajara en el arbol de elementos.
//En este caso el Scaffold
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de peliculas'),
        //Un Appbar tiene una barra de acciones. Son a grandes rasgos botones
        //Los Actions esperan un widget para la parte grafica y un método onPress
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
//En el cuerpo del Scaffold, va una columna para poner arriba el slide de peliculas
//en cartelera y abajo las peliculas por rating
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            width: _screen.width,
            height: _screen.height * 0.1,
            child: Container(
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: _screen.width,
            height: _screen.height * 0.7,
            // Swiper
            child: _swiperCards(context),
          ),
          SizedBox(
            width: _screen.width,
            height: _screen.height * 0.2,
            child: Container(
              color: Colors.white,
            )
          ),
        ],
      ),
    );
  }

  Widget _swiperCards(BuildContext context) {
    return FutureBuilder(
      future: peliculasProvider.getFromCinemas(),
      builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(films: snapshot.data!);
        } else {
          return const SizedBox(
              height: 500.0,
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
