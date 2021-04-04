import 'package:domain/entities/user.dart';

abstract class UserRepository {
  Future saveUserSession();
  Future<User> getUserSession();
  Future<User> loginWithFacebook();
  Future<User> loginWithGoogle();
}
