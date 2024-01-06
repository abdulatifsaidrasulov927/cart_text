import 'package:retrofit/retrofit.dart';
import 'package:cart_text/model/cat_fact_model.dart';
import 'package:dio/dio.dart';

part 'cat_api_service.g.dart';

@RestApi(baseUrl: "https://cat-fact.herokuapp.com/")
abstract class CatApiService {
  factory CatApiService(Dio dio, {String baseUrl}) = _CatApiService;

  @GET("/facts/random")
  Future<CatFact> getRandomCatFact();
}
