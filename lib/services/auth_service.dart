import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../core/utils/dio_client.dart';
import '../core/utils/token_storage.dart';
import '../features/profile/models/user_profile.dart';
import 'profile_service.dart';

class AuthService {
  static Future<void> login({
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

      final result = response.data['result'];

    
      final token = result['loginToken'];
      await TokenStorage.saveToken(token);

    
      final profileBox = Hive.box<UserProfile>('user_profile');

      final profile = UserProfile(
        userId: result['id'],
        name: result['name'],
        email: result['email'],
        badgeNumber: result['employee']['badge_number'].toString(),
      );

      await profileBox.put('current', profile);

      
      try {
        final profileResponse = await ProfileService.fetchProfile(
          badgeNumber: profile.badgeNumber,
        );



      } catch (_) {

      }

    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Login gagal',
      );
    }
  }
}
