// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_cat_fact_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RandomCatFactApiClient implements RandomCatFactApiClient {
  _RandomCatFactApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://cat-fact.herokuapp.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RandomCatFactModel?> getRandomCatFact() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<RandomCatFactModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/facts/random',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null
        ? null
        : RandomCatFactModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
