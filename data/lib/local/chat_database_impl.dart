import 'package:data/local/chat_database.dart';
import 'package:data/local/user/user_database.dart';
import 'package:data/local/user/user_database_impl.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChatDatabaseImpl implements ChatDatabase {
  UserDatabase _userDatabase;

  ChatDatabaseImpl() {
    _init();
  }

  _init() async {
    await Hive.initFlutter();
    this._userDatabase = UserDatabaseImpl();
  }

  @override
  UserDatabase get userDatabase => _userDatabase;
}
