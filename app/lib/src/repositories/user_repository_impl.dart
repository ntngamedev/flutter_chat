import 'package:data/external/client/chat_client.dart';
import 'package:data/local/chat_database.dart';
import 'package:domain/entities/user.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:app/src/mappers/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final ChatClient _chatClient;
  final ChatDatabase _chatDatabase;

  UserRepositoryImpl(this._chatClient, this._chatDatabase);

  @override
  Future removeUserSession() => _chatDatabase.userDatabase.removeUser();

  @override
  Future saveUserSession(User user) => _chatDatabase.userDatabase.saveUser(user.toUserLocal());

  @override
  Future<User> getUserSession() async => (await _chatDatabase.userDatabase.getUser()).toUser();

  @override
  Future<User> loginWithFacebook() async {
    final user = await _chatClient.facebookAPI.login();

    return User(
      user.id,
      user.name,
      user.avatarURL,
      UserType.facebook,
    );
  }

  @override
  Future<User> loginWithGoogle() {
    throw UnimplementedError();
  }
}
