import 'package:app/src/ui/login/login_controller.dart';
import 'package:app/src/ui/login/login_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind((i) => LoginController(i()))
  ];
  
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => LoginScreen())
  ];
}