import 'package:app/src/ui/home/home_controller.dart';
import 'package:app/src/ui/home/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind((i) => HomeController(i()))
  ];
  
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => HomeScreen())
  ];
}