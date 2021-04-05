import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_controller.dart';

abstract class AppState<TWidget extends StatefulWidget, TBind extends AppController> extends State<TWidget> {
  final TBind _controller = Modular.get<TBind>();
  TBind get controller => _controller;

  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();

    if (Modular.dispose<TBind>()) {
      return;
    }

    _controller.dispose();
  }
}
