import 'package:app/src/repositories/user_repository_impl.dart';
import 'package:app/src/ui/common/stores/auth_store.dart';
import 'package:app/src/ui/home/home_module.dart';
import 'package:app/src/ui/login/login_module.dart';
import 'package:app/src/ui/splash/splash_module.dart';
import 'package:data/external/client/chat_client_impl.dart';
import 'package:data/local/chat_database_impl.dart';
import 'package:domain/interactors/auth/auth_interactor.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind.singleton((i) => ChatDatabaseImpl()),
    Bind.singleton((i) => ChatClientImpl()),
    Bind.singleton((i) => UserRepositoryImpl(i(), i())),
    Bind.singleton((i) => AuthInteractor(i())),
    Bind.singleton((i) => AuthStore(i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/login', module: LoginModule()),
  ];
}