import 'package:domain/entities/user.dart';

abstract class UserRepository {
  Future saveUserSession(User user);
  Future removeUserSession();
  Future<User> getUserSession();
  Future<User> loginWithFacebook();
  Future logoutWithFacebook();
  Future<User> loginWithGoogle();
  Future logoutWithGoogle();
}
