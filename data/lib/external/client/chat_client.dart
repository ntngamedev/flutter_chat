import 'package:data/external/apis/facebook_api.dart';

abstract class ChatClient {
  final FacebookAPI facebookAPI;

  ChatClient(this.facebookAPI);
}
