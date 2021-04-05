import 'package:data/local/user/user_local.dart';
import 'package:domain/entities/user.dart';

extension UserLocalExtension on UserLocal {
  User toUser() {
    if (this == null) {
      return null;
    }

    return User(
      id,
      name,
      avatarURL,
      UserType.none,
    );
  }
}

extension UserExtension on User {
  UserLocal toUserLocal() {
    return UserLocal(
      id,
      name,
      avatarURL,
      type.toString(),
    );
  }
}
