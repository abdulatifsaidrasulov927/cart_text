import 'package:cart_text/model/cat_fact_model.dart';

abstract class CatState {}

class CatInitial extends CatState {}

class CatLading extends CatState {}

class CatLoaded extends CatState {
  final CatFact catFact;
  final String catImageUrl;
  CatLoaded({
    required this.catFact,
    required this.catImageUrl,
  });
}

class CatError extends CatState {
  final String errorMessage;

  CatError({required this.errorMessage});
}
