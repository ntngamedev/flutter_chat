import 'package:domain/entities/user.dart';
import 'package:domain/interactors/auth/errors/user_not_session_exception.dart';
import 'package:domain/repositories/user_repository.dart';

class AuthInteractor {
  final UserRepository _userRepository;

  AuthInteractor(this._userRepository);

  Future saveUserSession(User user) => _userRepository.saveUserSession(user);

  Future removeUserSession() => _userRepository.removeUserSession();

  Future<User> getUserSesion() async {
    final user = await _userRepository.getUserSession();

    if (user == null) {
      throw UserNotSessionException();
    }

    return user;
  }

  Future<User> loginWithFacebook() async {
    final user = await _userRepository.loginWithFacebook();

    saveUserSession(user);

    return user;
  }

  Future<User> loginWithGoogle() async {
    final user = await _userRepository.loginWithGoogle();

    saveUserSession(user);

    return user;
  }
}
