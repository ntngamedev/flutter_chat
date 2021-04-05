import 'package:app/src/ui/common/app_controller.dart';
import 'package:app/src/ui/common/stores/auth_store.dart';

class HomeController extends AppController {
  final AuthStore _authStore;

  HomeController(this._authStore);

  AuthStore get authStore => _authStore;
}
