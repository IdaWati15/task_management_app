import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tas_management_app/app/routes/app_pages.dart';

class AuthController extends GetxController {
  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  


  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  print(googleUser!.email);
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance
  .signInWithCredential(credential);
}
Future logout()async{
  await FirebaseAuth.instance.signOut();
  Get.offAllNamed(Routes.LOGIN);
}
}
