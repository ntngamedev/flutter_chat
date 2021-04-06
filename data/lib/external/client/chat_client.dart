import 'package:data/external/apis/facebook_api.dart';
import 'package:data/external/apis/google_sigin_api.dart';

abstract class ChatClient {
  final FacebookAPI facebookAPI;
  final GoogleSiginApi googleSiginApi;

  ChatClient(this.facebookAPI, this.googleSiginApi);
}
