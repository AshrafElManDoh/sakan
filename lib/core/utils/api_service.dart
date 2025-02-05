import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://sakan.runasp.net/api/Account/';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Object data,
  }) async {
    
    var response = await _dio.post('$_baseUrl$endPoint',data: data);

    return response.data;
  }
}
