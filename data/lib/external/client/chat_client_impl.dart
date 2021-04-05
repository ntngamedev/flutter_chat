
import 'package:data/external/apis/facebook_api.dart';

import 'chat_client.dart';

class ChatClientImpl implements ChatClient {

  @override
  FacebookAPI get facebookAPI => FacebookAPI();
}