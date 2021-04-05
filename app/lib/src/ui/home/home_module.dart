import 'package:app/src/ui/home/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => HomeScreen())
  ];
}