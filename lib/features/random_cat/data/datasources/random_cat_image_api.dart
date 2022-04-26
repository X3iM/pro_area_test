import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../app.dart';

part 'random_cat_image_api.g.dart';

@RestApi(baseUrl: 'https://cataas.com/')
abstract class RandomCatImageApiClient {
  factory RandomCatImageApiClient(Dio dio, {String? baseUrl}) = _RandomCatImageApiClient;

  @GET(Apis.randomCatImage)
  Future<Uint8List?> getRandomCatImage();
}

