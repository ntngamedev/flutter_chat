import 'package:app/src/ui/common/app_controller.dart';
import 'package:app/src/ui/common/stores/auth_store.dart';

class LoginController extends AppController {
  final AuthStore _authStore;

  LoginController(this._authStore);

  AuthStore get authStore => _authStore;

  loginWithFacebook() {
    _authStore.loginWithFacebook();
  }
}
