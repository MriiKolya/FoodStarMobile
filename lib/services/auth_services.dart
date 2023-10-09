import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../firebase_options.dart';

class AuthServices
{
  signWithGoogle() async 
  {
    final GoogleSignInAccount? userGoogle = await GoogleSignIn(clientId: DefaultFirebaseOptions.currentPlatform.iosClientId).signIn();
    final GoogleSignInAuthentication gAuth = await userGoogle!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken 
    );
    
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}