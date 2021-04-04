import 'package:domain/entities/user.dart';
import 'package:domain/interactors/auth/auth_interactor.dart';
import 'package:domain/interactors/auth/errors/user_not_session_exception.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

void main() {
  UserRepository _userRepository;
  AuthInteractor _authInteractor;
  User _userNone;
  User _userFacebook;
  User _userGoogle;

  setUpAll(() {
    _userRepository = UserRepositoryMock();
    _authInteractor = AuthInteractor(_userRepository);
    _userNone = User("1", "Fulano", "", UserType.none);
    _userFacebook = User("2", "Beltrano", "", UserType.facebook);
    _userGoogle = User("2", "Francisco", "", UserType.google);
  });

  group("Auth Interactor: ", () {
    test("getUserSession should return an User", () async {
      when(() => _userRepository.getUserSession()).thenAnswer((_) async => _userNone);
      expect(await _authInteractor.getUserSesion(), isA<User>());
    });

    test("getUserSession when not user in session should return UserNotSessionException", () {
      when(() => _userRepository.getUserSession()).thenAnswer((_) async => null);
      expect(() async => await _authInteractor.getUserSesion(), throwsA(isA<UserNotSessionException>()));
    });

    test("saveUserSesiion shoud return nothing", () async {
      expect((await _authInteractor.saveUserSession()), isA());
      verify(() => _authInteractor.saveUserSession()).called(1);
    });

    test("loginWithFacebook shoud return an User with type facebook", () async {
      when(() => _userRepository.loginWithFacebook()).thenAnswer((_) async => _userFacebook);
      expect((await _authInteractor.loginWithFacebook()).type, equals(UserType.facebook));
    });

    test("loginWithGoogle shoud return an User with type google", () async {
      when(() => _userRepository.loginWithGoogle()).thenAnswer((_) async => _userGoogle);
      expect((await _authInteractor.loginWithGoogle()).type, equals(UserType.google));
    });
  });
}
