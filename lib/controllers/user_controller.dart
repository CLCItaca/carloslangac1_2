import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";

class UserController {

  static String? nombre = "";
  static String? email = "";
  static String? foto = "";

  static Future<UserCredential?> loginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null){
        return null;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, 
        idToken: googleAuth.idToken
      );

      final usarCredential = FirebaseAuth.instance.signInWithCredential(credential);
      nombre = googleUser.displayName;
      foto = googleUser.photoUrl;

      return usarCredential;
    }
    catch (e){
      return null;
    }
    
  }
}