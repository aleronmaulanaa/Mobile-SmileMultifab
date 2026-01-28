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

      // 1️⃣ SIMPAN TOKEN
      final token = result['loginToken'];
      await TokenStorage.saveToken(token);

      // 2️⃣ SIMPAN PROFILE DASAR DARI LOGIN
      final profileBox = Hive.box<UserProfile>('user_profile');

      final profile = UserProfile(
        userId: result['id'],
        name: result['name'],
        email: result['email'],
        badgeNumber: result['employee']['badge_number'].toString(),
      );

      await profileBox.put('current', profile);

      // 3️⃣ AMBIL PROFILE LENGKAP (ONLINE)
      try {
        final profileResponse = await ProfileService.fetchProfile(
          badgeNumber: profile.badgeNumber,
        );

        // kalau backend kirim data tambahan,
        // kamu bisa update Hive di sini
        // (sementara kita biarkan)

      } catch (_) {
        // kalau gagal, TIDAK MASALAH
        // profile dasar sudah ada
      }

    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Login gagal',
      );
    }
  }
}
