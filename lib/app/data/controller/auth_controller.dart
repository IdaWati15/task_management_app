import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tas_management_app/app/routes/app_pages.dart';

class AuthController extends GetxController {
  UserCredential? _userCredential;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
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
 await FirebaseAuth.instance
  .signInWithCredential(credential)
  .then((value) => _userCredential = value);


  // firebase
 collectionReferense users= fireStore.collection('users');

  final cekUsers = await users.doc(googleUser.email).get();
  if (!cekUsers.exits) {

  users.doc(googleUser.email).set({
    'uid':_userCredential!.user!.uid,
    'name':googleUser.displayName,
    'email':googleUser.email,
    'photo':googleUser.photoUrl,
    'createdAt':_userCredential!.user!.metadata.creationTime.toString(),
    'LastLoginAt':
    _userCredential!.user!.metadata.lastSignInTime.toString(),
    
  });
  }
  else {
  users.doc(googleUser.email).set({
    'LastLoginAt': _userCredential!.user!.metadata.lastSignInTime.toString(),
  });
  }
  Get.offAllNamed(Routes.HOME);
}


Future logout()async{
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut();
  Get.offAllNamed(Routes.LOGIN);
}
}
