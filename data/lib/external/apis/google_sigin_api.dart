import 'package:data/external/contracts/google/google_user_contract.dart';
import 'package:data/external/errors/google/google_login_failed.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSiginApi {
  GoogleSignIn _googleSignIn;

  GoogleSiginApi() {
    _googleSignIn = GoogleSignIn();
  }

  Future<GoogleUserContract> login() async {
    try {
      final account = await _googleSignIn.signIn();

      return GoogleUserContract(
        account.id,
        account.displayName,
        account.photoUrl,
      );
    } catch (ex) {
      throw GoogleLoginFailed();
    }
  }

  Future logout() => _googleSignIn.signOut();
}
