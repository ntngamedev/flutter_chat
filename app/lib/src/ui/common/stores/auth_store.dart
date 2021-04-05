import 'package:domain/entities/user.dart';
import 'package:domain/interactors/auth/auth_interactor.dart';
import 'package:domain/interactors/auth/errors/user_not_session_exception.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthStore extends NotifierStore<Exception, User> {
  final AuthInteractor _authInteractor;

  AuthStore(this._authInteractor) : super(null);

  goHomeScreen() {
    Modular.to.navigate('/home');
  }

  goLoginScreen() {
    Modular.to.navigate('/login');
  }

  verifyUserSession() async {
    try {
      update(await _authInteractor.getUserSesion());
      goHomeScreen();
    } catch (ex) {
      if (ex is UserNotSessionException) {
        goLoginScreen();
      } else {
        throw ex;
      }
    }
  }

  loginWithFacebook() async {
    setLoading(true);
    try {
      update(await _authInteractor.loginWithFacebook());
      goHomeScreen();
    } catch (ex) {
      setError(ex);
    }
    setLoading(false);
  }

  logout() {
    update(null);
    goLoginScreen();
  }
}
