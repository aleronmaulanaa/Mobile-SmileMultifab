import 'package:dio/dio.dart';
import '../core/utils/dio_client.dart';

class ProfileService {
  static Future<Map<String, dynamic>> fetchProfile({
    required String badgeNumber,
  }) async {
    final dio = DioClient.createDio();

    final response = await dio.post(
      'user/profile',
      data: {
        'badge_number': badgeNumber,
      },
    );

    return response.data;
  }
}
