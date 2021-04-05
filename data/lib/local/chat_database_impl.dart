import 'package:data/local/chat_database.dart';
import 'package:data/local/user/user_database.dart';
import 'package:data/local/user/user_database_impl.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

class ChatDatabaseImpl implements ChatDatabase {
  UserDatabase _userDatabase;

  ChatDatabaseImpl() {
    _init();
  }

  _init() async {
    Hive.init((await getApplicationSupportDirectory()).path);
    this._userDatabase = UserDatabaseImpl();
  }

  @override
  UserDatabase get userDatabase => _userDatabase;
}
