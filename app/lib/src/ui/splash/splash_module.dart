import 'package:app/src/ui/splash/splash_controller.dart';
import 'package:app/src/ui/splash/splash_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind((i) => SplashController(i()))
  ];
  
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => SplashScreen())
  ];
}