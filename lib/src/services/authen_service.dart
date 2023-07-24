import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    final GoogleSignInAccount? getUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication getAuthen = await getUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: getAuthen.accessToken, idToken: getAuthen.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
