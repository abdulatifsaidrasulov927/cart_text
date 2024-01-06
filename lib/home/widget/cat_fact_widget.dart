import 'package:cart_text/model/cat_fact_model.dart';
import 'package:flutter/material.dart';

class CatFactWidget extends StatelessWidget {
  final CatFact catFact;

  final String catImageUrl;

  const CatFactWidget(
      {super.key, required this.catFact, required this.catImageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            catImageUrl,
            width: 300,
            height: 300,
          ),
          Text(
            catFact.text,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Created on: ${catFact.creationDate}',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
