import 'package:hive/hive.dart';

part 'user_profile.g.dart';

@HiveType(typeId: 30) // PASTI TIDAK BENTROK DENGAN ATTENDANCE
class UserProfile extends HiveObject {
  @HiveField(0)
  final int userId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String badgeNumber;

  UserProfile({
    required this.userId,
    required this.name,
    required this.email,
    required this.badgeNumber,
  });
}
