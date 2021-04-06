import 'package:hive/hive.dart';

part 'user_local.g.dart';

@HiveType(typeId: 0)
class UserLocal extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String avatarURL;

  UserLocal(this.id, this.name, this.avatarURL);
}