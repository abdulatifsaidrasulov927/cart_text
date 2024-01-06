import 'package:cart_text/bloc/cat_bloc.dart';
import 'package:cart_text/bloc/cat_state.dart';
import 'package:cart_text/home/widget/cat_fact_widget.dart';
// import 'package:cart_text/model/cat_fact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final catBloc = BlocProvider.of<CatBloc>(context);
    BlocProvider.of<CatBloc>(context).fetchRandomCatFact();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Cat Facts',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<CatBloc, CatState>(
        builder: (context, state) {
          if (state is CatInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CatLoaded) {
            return CatFactWidget(
              catFact: state.catFact,
              catImageUrl: state.catImageUrl,
            );
          } else if (state is CatError) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          } else if (state is CatLading) {
            return const Center(
                child: Center(child: CircularProgressIndicator()));
          }
          return Container();
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              // catFactList.add(context.read<CatLoaded>().catFact);
              // catBloc.saveCatFactToHive(context.read<CatLoaded>().catFact);
              BlocProvider.of<CatBloc>(context).fetchRandomCatFact();
            },
            tooltip: 'Another fact!',
            child: const Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/factHistory');
            },
            tooltip: 'Fact Hisstory!',
            child: const Icon(Icons.navigate_next_rounded),
          ),
        ],
      ),
    );
  }
}
