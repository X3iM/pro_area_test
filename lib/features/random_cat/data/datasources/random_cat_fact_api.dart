import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../app.dart';

part 'random_cat_fact_api.g.dart';

@RestApi(baseUrl: 'https://cat-fact.herokuapp.com/')
abstract class RandomCatFactApiClient {
  factory RandomCatFactApiClient(Dio dio, {String? baseUrl}) = _RandomCatFactApiClient;

  @GET(Apis.randomCatFact)
  Future<RandomCatFactModel?> getRandomCatFact();
}

