import 'package:data/local/user/user_local.dart';

abstract class UserDatabase {
  Future removeUser();
  Future saveUser(UserLocal userLocal);
  Future <UserLocal> getUser();
}
