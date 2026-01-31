import 'package:dio/dio.dart';
import '../constants/api_config.dart';

class DioClient {
  static Dio createDio({String? token}) {
    return Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      ),
    );
  }
}
