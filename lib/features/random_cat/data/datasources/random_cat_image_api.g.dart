// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_cat_image_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RandomCatImageApiClient implements RandomCatImageApiClient {
  _RandomCatImageApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://cataas.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Uint8List?> getRandomCatImage() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(
        _setStreamType<Uint8List>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/cat',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    List<int> list = _result.data!.codeUnits;
    Uint8List bytes = Uint8List.fromList(list);
    return bytes;
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
