import 'package:dio/dio.dart';

abstract class Failure {
  final String errmsg;
  const Failure({required this.errmsg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errmsg});

  factory ServerFailure.fromDioErrors(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errmsg: "Connection Time out ,please try again!");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errmsg: "Send Time out ,please try again!");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errmsg: "Receive Time out ,please try again!");
      case DioExceptionType.badCertificate:
        return ServerFailure(errmsg: "Bad certificate ,please try again!");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.error);
      case DioExceptionType.cancel:
        return ServerFailure(errmsg: "Your request canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(errmsg: "Connection error");
      case DioExceptionType.unknown:
        return ServerFailure(
            errmsg: "OOPs there was an error , please try again later!");
      default:
        return ServerFailure(
            errmsg: "OOPs there was an error , please try again later!");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errmsg: response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure(errmsg: "Your request not found!");
    } else if (statusCode == 500) {
      return ServerFailure(errmsg: "Internal Server error ,please try again!");
    } else {
      return ServerFailure(
          errmsg: "OOPs there was an error , please try again later!");
    }
  }
}
