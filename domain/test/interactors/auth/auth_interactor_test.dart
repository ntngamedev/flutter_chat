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
    test("saveUserSession shoud return nothing", () async {
      expect((await _authInteractor.saveUserSession(_userNone)), isA());
      verify(() => _userRepository.saveUserSession(_userNone)).called(1);
    });

    test("removeUserSession shoud return nothing", () async {
      expect((await _authInteractor.removeUserSession()), isA());
      verify(() => _userRepository.removeUserSession()).called(1);
    });

    test("getUserSession should return an User", () async {
      when(() => _userRepository.getUserSession()).thenAnswer((_) async => _userNone);
      expect(await _authInteractor.getUserSesion(), isA<User>());
    });

    test("getUserSession when not user in session should return UserNotSessionException", () {
      when(() => _userRepository.getUserSession()).thenAnswer((_) => null);
      expect(() async => _authInteractor.getUserSesion(), throwsA(isA<UserNotSessionException>()));
    });

    test("loginWithFacebook shoud return user type facebook and save user in session", () async {
      when(() => _userRepository.loginWithFacebook()).thenAnswer((_) async => _userFacebook);
      expect((await _authInteractor.loginWithFacebook()).type, equals(UserType.facebook));
      verify(() => _userRepository.loginWithFacebook()).called(1);
      verify(() => _userRepository.saveUserSession(_userFacebook)).called(1);
    });

    test("loginWithGoogle shoud return user type google and save user in session", () async {
      when(() => _userRepository.loginWithGoogle()).thenAnswer((_) async => _userGoogle);
      expect((await _authInteractor.loginWithGoogle()).type, equals(UserType.google));
      verify(() => _userRepository.loginWithGoogle()).called(1);
      verify(() => _userRepository.saveUserSession(_userGoogle)).called(1);
    });
  });
}
