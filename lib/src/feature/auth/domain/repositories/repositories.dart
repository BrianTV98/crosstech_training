import 'package:cross_tech/src/feature/auth/data/data_source/remote/auth_local.dart';
import 'package:cross_tech/src/feature/auth/data/data_source/remote/auth_service.dart';

abstract class AuthRepository{
  final AuthRestApi remote;
  final AuthLocal storage;

  AuthRepository(this.remote, this.storage);

  Future<bool> loginWithEmail(String userName, String password);
  Future<bool> loginWithApple(String appleID, String appleToken);
  Future<bool> loginWithGoogle(String appleID, String googleToken);
}