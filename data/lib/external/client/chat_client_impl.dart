
import 'package:data/external/apis/facebook_api.dart';
import 'package:data/external/apis/google_sigin_api.dart';

import 'chat_client.dart';

class ChatClientImpl implements ChatClient {

  @override
  FacebookAPI get facebookAPI => FacebookAPI();

  @override
  GoogleSiginApi get googleSiginApi => GoogleSiginApi();
}