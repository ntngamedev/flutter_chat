import 'package:app/src/ui/common/app_state.dart';
import 'package:app/src/ui/common/widgets/app_logo.dart';
import 'package:app/src/ui/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends AppState<LoginScreen, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: AppLogo(),
          ),
          SignInButton(
            Buttons.Facebook,
            onPressed: () => controller.loginWithFacebook(),
          ),
          SizedBox(height: 4.0),
          SignInButton(
            Buttons.Google,
            onPressed: () {},
          ),
          SizedBox(height: 48.0),
        ],
      ),
    );
  }
}
