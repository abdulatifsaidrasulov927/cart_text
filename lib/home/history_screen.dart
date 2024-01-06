// history_screen.dart
import 'package:cart_text/model/cat_fact_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fact History'),
      ),
      body: FutureBuilder(
        future: Hive.openBox<CatFact>('catFacts'), // Specify the type here
        builder: (BuildContext context, AsyncSnapshot<Box<CatFact>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final catFactsBox = snapshot.data;
              final catFacts = catFactsBox?.values.toList();

              return ListView.builder(
                itemCount: catFacts?.length,
                itemBuilder: (context, index) {
                  final CatFact fact = catFacts![index];
                  return ListTile(
                    title: Text(fact.text),
                    subtitle: Text('Created on: ${fact.creationDate}'),
                  );
                },
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/');
        },
        tooltip: 'Fact car!',
        child: const Icon(Icons.navigate_before),
      ),
    );
  }
}
