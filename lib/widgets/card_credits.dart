
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
    const int a = 3;
    return Container(
      height: 50,
      color: Colors.cyan,
      child: Text(
        'Credits $a : ${credits.cast}'
      ),
    );
  }}