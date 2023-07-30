import '../../domain/repositories/repositories.dart';

class AuthRepositoryImp extends AuthRepository{

  AuthRepositoryImp(super.remote, super.storage);

  @override
  Future<bool> loginWithApple(String appleID, String appleToken) {
    // TODO: implement loginWithApple
    throw UnimplementedError();
  }

  @override
  Future<bool> loginWithEmail(String userName, String password) {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> loginWithGoogle(String appleID, String googleToken) {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }

}