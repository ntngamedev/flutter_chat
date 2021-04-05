import 'package:asuka/asuka.dart' as asuka;
import 'package:app/src/ui/common/app_state.dart';
import 'package:app/src/ui/common/stores/auth_store.dart';
import 'package:app/src/ui/common/widgets/app_logo.dart';
import 'package:app/src/ui/login/login_controller.dart';
import 'package:data/external/errors/facebook/facebook_login_failed.dart';
import 'package:domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_triple/flutter_triple.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends AppState<LoginScreen, LoginController> {
  _showSnackBar(String text) {
    asuka.showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Colors.red.shade900,
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: AppLogo(),
                ),
                SignInButton(
                  Buttons.Facebook,
                  onPressed: () {
                    asuka.removeCurrentSnackBar();
                    controller.loginWithFacebook();
                  },
                ),
                SizedBox(height: 4.0),
                SignInButton(
                  Buttons.Google,
                  onPressed: () {},
                ),
                SizedBox(height: 48.0),
              ],
            ),
          ),
          Positioned.fill(
            child: ScopedBuilder<AuthStore, Exception, User>(
              store: controller.authStore,
              onLoading: (context) {
                return Container(
                  color: Colors.black.withOpacity(0.5),
                );
              },
              onError: (context, error) {
                if (error is FacebookLoginFailed) {
                  _showSnackBar('Login with Facebook failed.');
                }

                return Container();
              },
              onState: (context, state) {
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
