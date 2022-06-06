// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://192.168.219.103:80/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponMessage> login(staffData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(staffData.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponMessage>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApiResponMessage.fromJson(_result.data!);
    return value;
  }

  @override
  Stream<List<PostData>> getAllPost(authApi) async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authApi};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<PostData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/posts',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => PostData.fromJson(i as Map<String, dynamic>))
        .toList();
    yield value;
  }

  @override
  Future<PostData> getPost(authApi, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authApi};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PostData>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/post/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PostData.fromJson(_result.data!);
    return value;
  }

  @override
  Stream<List<PostData>> getRecommentPostByCategory(
      authApi, categoryData) async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'category': categoryData};
    final _headers = <String, dynamic>{r'Authorization': authApi};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<PostData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/getRecomment',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => PostData.fromJson(i as Map<String, dynamic>))
        .toList();
    yield value;
  }

  @override
  Stream<List<SaleData>> getAllSalePost(authApi) async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authApi};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<SaleData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/sales',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => SaleData.fromJson(i as Map<String, dynamic>))
        .toList();
    yield value;
  }

  @override
  Stream<List<SaleData>> getLimitSalePost(authApi) async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authApi};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<SaleData>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/salesLimit',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => SaleData.fromJson(i as Map<String, dynamic>))
        .toList();
    yield value;
  }

  @override
  Future<SaleData> getSalePost(authApi, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': authApi};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SaleData>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/sale/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SaleData.fromJson(_result.data!);
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
