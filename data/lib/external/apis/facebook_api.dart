import 'package:data/external/contracts/facebook/facebook_user_contract.dart';
import 'package:data/external/errors/facebook/facebook_login_failed.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAPI {
  final FacebookAuth _instance = FacebookAuth.instance;

  Future<bool> isLogged() async => (await _instance.accessToken != null);

  Future<FacebookUserContract> login() async {
    final result = await _instance.login(permissions: ["public_profile"]);

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();

      return FacebookUserContract(
        userData["id"],
        userData["name"],
        userData["picture"]["data"]["url"],
      );
    }

    throw FacebookLoginFailed();
  }

  Future logout() => _instance.logOut();
}
