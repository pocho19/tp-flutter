
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:clase06pocho/models/credits_model.dart';

class CardCredits extends StatelessWidget {
  final Credits credits;
  const CardCredits({
    Key? key,
    required this.credits
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 25,
        ),
        Column(
          children: _cardList(context)
        // 'Credits : ${credits.cast[1].name}'
      ),]
    );
  }
  List<Widget> _cardList(BuildContext context) {
    List<Widget> items = [];
    Widget temp;
    if(credits.cast.isEmpty){
      items.add(const Text(
        'Sin datos del elenco'
      ));
    }else{
      for(var element in credits.cast){
        temp = SizedBox(
          height: 50,
          child: Text(
              '${element.name} ---> ${element.character}'
          ),
        );
        items.add(temp);
      }
    }
    return items;

  }
}