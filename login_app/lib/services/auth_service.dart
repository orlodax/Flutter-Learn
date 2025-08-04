import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    final GoogleSignIn signIn = GoogleSignIn.instance;
    unawaited(
      signIn.initialize(
        serverClientId:
            '623440976534-d6vt0otmv29642uunojfrcclv70i5e8q.apps.googleusercontent.com',
      ),
    );

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await signIn.authenticate();

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleUser.authentication.idToken,
      );

      // Sign in to Firebase with the credential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // print('Error signing in with Google: $e');
      return null;
    }
  }
}
