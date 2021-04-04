import 'package:domain/entities/user.dart';
import 'package:domain/interactors/auth/errors/user_not_session_exception.dart';
import 'package:domain/repositories/user_repository.dart';

class AuthInteractor {
  final UserRepository _userRepository;

  AuthInteractor(this._userRepository);

  Future saveUserSession() {
    return _userRepository.saveUserSession();
  }

  Future<User> getUserSesion() async {
    final user = await _userRepository.getUserSession();

    if (user == null) {
      throw UserNotSessionException();
    }

    return user;
  }

  Future<User> loginWithFacebook() {
    return _userRepository.loginWithFacebook();
  }

  Future<User> loginWithGoogle() {
    return _userRepository.loginWithGoogle();
  }
}
