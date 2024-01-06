import 'package:cart_text/bloc/cat_bloc.dart';
import 'package:cart_text/home/cat_scree.dart';
import 'package:cart_text/home/history_screen.dart';
import 'package:cart_text/model/cat_fact_model.dart';
import 'package:cart_text/servis/cat_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<CatFact>('catFacts');

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final Dio dio = Dio();
    return BlocProvider(
      create: (context) => CatBloc(
          catApiService:
              CatApiService(dio, baseUrl: 'https://cat-fact.herokuapp.com/')),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Facts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CatScreen(),
        '/factHistory': (context) => HistoryScreen(),
      },
    );
  }
}
// import 'package:flutter/material.dart';

// class CatImageScreen extends StatefulWidget {
//   const CatImageScreen({Key? key}) : super(key: key);

//   @override
//   _CatImageScreenState createState() => _CatImageScreenState();
// }

// class _CatImageScreenState extends State<CatImageScreen> {
//   late String catImageUrl;

//   @override
//   void initState() {
//     super.initState();
//     // Initial cat image URL
//     catImageUrl = 'https://cataas.com/cat';
//   }

//   void updateCatImage() {
//     // Update cat image URL when the button is pressed
//     setState(() {
//       catImageUrl =
//           'https://cataas.com/cat?${DateTime.now().millisecondsSinceEpoch}';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cat Image Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Display the network image
//             Image.network(
//               catImageUrl,
//               width: 300,
//               height: 300,
//             ),
//             const SizedBox(height: 20),
//             // Button to update the cat image
//             ElevatedButton(
//               onPressed: updateCatImage,
//               child: const Text('Get Another Cat Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: const CatImageScreen(),
//     ),
//   );
// }
