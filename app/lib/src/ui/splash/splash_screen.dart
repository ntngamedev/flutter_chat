import 'package:app/src/ui/common/app_state.dart';
import 'package:app/src/ui/common/widgets/app_logo.dart';
import 'package:app/src/ui/splash/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends AppState<SplashScreen, SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AppLogo(),
          ),
          CircularProgressIndicator(),
          SizedBox(height: 48.0),
        ],
      ),
    );
  }
}