import 'package:bloc/bloc.dart';
import 'package:cart_text/bloc/cat_state.dart';
import 'package:cart_text/servis/cat_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatBloc extends Cubit<CatState> {
  final CatApiService catApiService;

  CatBloc({required this.catApiService}) : super(CatInitial());

  Future<void> fetchRandomCatFact() async {
    try {
      emit(CatLading());
      final catFact = await catApiService.getRandomCatFact();
      emit(CatLoaded(
        catFact: catFact,
        catImageUrl:
            'https://cataas.com/cat?${DateTime.now().millisecondsSinceEpoch}',
      ));
    } catch (e) {
      print(e);
      emit(CatError(errorMessage: 'Failed to fetch cat fact'));
    }
  }
}
