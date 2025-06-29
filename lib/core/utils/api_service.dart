import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://sakan.runasp.net/api/';
  final Dio _dio;
  ApiService(this._dio);

  Future<dynamic> post({
    required String endPoint,
    required Object data,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    return response.data;
  }
}
