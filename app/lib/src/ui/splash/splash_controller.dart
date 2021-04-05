import 'package:app/src/ui/common/app_controller.dart';
import 'package:app/src/ui/common/stores/auth_store.dart';

class SplashController extends AppController {
  final AuthStore _authStore;

  SplashController(this._authStore);

  @override
  void init() async {
    await Future.delayed(Duration(seconds: 3));
    _authStore.verifyUserSession();
  }
}
