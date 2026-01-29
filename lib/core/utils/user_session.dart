import 'package:hive/hive.dart';
import '../../features/profile/models/user_profile.dart';

class UserSession {
  static String? getUserId() {
    final box = Hive.box<UserProfile>('user_profile');
    final profile = box.get('current');
    return profile?.badgeNumber;
  }

  static UserProfile? getProfile() {
    final box = Hive.box<UserProfile>('user_profile');
    return box.get('current');
  }

  static Future<void> clear() async {
    final box = Hive.box<UserProfile>('user_profile');
    await box.delete('current');
  }
}
