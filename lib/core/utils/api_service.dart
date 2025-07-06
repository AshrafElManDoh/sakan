import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://sakan.runasp.net/api/';
  final Dio _dio;
  ApiService(this._dio);

  Future<dynamic> post({
    required String endPoint,
    required Object data,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
    );
    return response.data;
  }

  Future<dynamic> postID({
    required String url,
    required Object data,
  }) async {
    var response = await _dio.post(
      url,
      data: data,
    );
    return response.data;
  }

  Future<dynamic> get(
      {required String endPoint, Map<String, dynamic>? queryParams}) async {
    var response =
        await _dio.get('$_baseUrl$endPoint', queryParameters: queryParams);
    return response.data;
  }
}
