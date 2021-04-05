import 'dart:async';

import 'package:data/local/user/user_database.dart';
import 'package:data/local/user/user_local.dart';
import 'package:hive/hive.dart';

class UserDatabaseImpl implements UserDatabase {
  static const _UNIQUE = "UNIQUE";
  final _instance = Completer<Box<UserLocal>>();

  UserDatabaseImpl() {
    _init();
  }

  _init() async {
    Hive.registerAdapter(UserLocalAdapter());
    _instance.complete(await Hive.openBox("user"));
  }

  @override
  Future removeUser() async {
    final box = await _instance.future;
    box.delete(_UNIQUE);
  }

  @override
  Future saveUser(UserLocal userLocal) async {
    final box = await _instance.future;
    box.put(_UNIQUE, userLocal);
  }

  @override
  Future<UserLocal> getUser() async {
    final box = await _instance.future;
    return box.get(_UNIQUE);
  }
}
