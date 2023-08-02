import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_apple_sign_in/scope.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

import '../../commonts/base_cubit.dart';
import '../../helpers/string_helper.dart';
import '../../services/authen_service.dart';
import 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());
  FirebaseAuth auth = FirebaseAuth.instance;
  final AuthService _authService = AuthService();
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  void setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
  }

  Future<void> signup() async {
    try {
      emit(const LoginState.loading());
      if (StringHelper.isEmail(_email) &&
          StringHelper.isPassword(_password) &&
          _password == _confirmPassword) {
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        if (user.user != null) {
          emit(const LoginState.success());
        } else {
          emit(LoginState.error(massege: tr('login.error_email')));
        }
      }
    } catch (e) {
      emit(LoginState.error(massege: tr('login.error_email')));
    }
  }

  Future<void> signIn() async {
    try {
      emit(const LoginState.loading());
      if (StringHelper.isEmail(_email) && _password.isNotEmpty) {
        final userLogin = await auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        if (userLogin.user != null) {
          emit(const LoginState.success());
        } else {
          emit(LoginState.error(massege: tr('login.error_email')));
        }
      }
    } catch (e) {
      emit(LoginState.error(massege: tr('login.error_email')));
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      emit(const LoginState.loading());
      final GoogleSignInAccount? getUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication getAuthen =
          await getUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: getAuthen.accessToken, idToken: getAuthen.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(const LoginState.success());
    } catch (e) {
      emit(LoginState.error(massege: tr('login.error_email')));
    }
    return null;
  }

  // Future<UserCredential?> signInWithFacebook() async {
  //   try {
  //     emit(const LoginState.loading());
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //     FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //     emit(const LoginState.success());
  //   } catch (e) {
  //     emit(LoginState.error(massege: tr('login.error_email')));
  //   }
  //   return null;
  // }

  Future<void> signInWithApple() async {
    try {
      await _authService.signInWithApple(
        scopes: [Scope.email, Scope.fullName],
      );
      emit(const LoginState.success());
    } catch (e) {
      emit(LoginState.error(massege: tr('login.error_email')));
    }
  }

  Future<void> resetPassword() async {
    try {
      emit(const LoginState.loading());
      if (StringHelper.isEmail(_email)) {
        await auth.sendPasswordResetEmail(
          email: _email.trim(),
        );
        emit(const LoginState.fogotPassword());
      } else {
        emit(LoginState.error(massege: tr('login.error_email')));
      }
    } catch (e) {
      emit(LoginState.error(massege: tr('login.error_email')));
    }
  }
}
