import 'package:dio/dio.dart';
import '../core/utils/dio_client.dart';

class AuthService {
  static Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final dio = DioClient.createDio();

      final response = await dio.post(
        'auth/login',
        data: {
          "email": email,
          "password": password,
          "deviceId": ""
        },
      );

      // 🔴 LOG RESPONSE ASLI
      print('LOGIN RESPONSE => ${response.data}');

      // sementara jangan ambil token dulu
      return '';
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Login gagal',
      );
    }
  }
}
