import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kcroz/src/features/authentication/screens/models/user_model.dart';
import 'package:kcroz/src/features/authentication/screens/screens/signup/signup_screen.dart';
import 'package:kcroz/src/services/exceptions/login_email_password_failure.dart';
import 'package:kcroz/src/services/storage_methods.dart';


import '../features/authentication/screens/models/user_model.dart';
import '../utils/show_snack_bar.dart';
import 'exceptions/signup_email_password_failure.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snapshot = await _firestore.collection("users").doc(currentUser.uid).get();
    return UserModel.fromSnap(snapshot);
  }


  // STATE PERSISTENCE STREAM
  // stream of users which will tel if the user is present or not


  // EMAIL SIGN UP
  Future<String> signUpWithEmail({
    required String email,
    required String fullName,
    required String phoneNumber,
    required String password,
    required String religion,
    required String gender,
    required String sexualOrientation,
    required String birthday,
    required String interests,
    required Uint8List file,
    required BuildContext context,
  }) async {
    String result = "Error - An Unknown error occurred.";
    try {
      if(email.isNotEmpty
          && fullName.isNotEmpty
          && phoneNumber.isNotEmpty
          && password.isNotEmpty
          && religion.isNotEmpty
          && gender.isNotEmpty
          && birthday.isNotEmpty
          && interests.isNotEmpty
          && file != null
          && sexualOrientation.isNotEmpty ) {
        // Register the user
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String dpURL = await StorageMethods().uploadImageToStorage("profilePictures", file, false);

        UserModel user = UserModel(
          uid: userCredential.user!.uid,
          username: fullName,
          email: email,
          phoneNumber: phoneNumber,
          dpURL: dpURL,
          religion: religion,
          gender: gender,
          sexualOrientation: sexualOrientation,
          birthday: birthday,
          interests: interests,
          followers: []
        );

        // add user to the firestore
        await _firestore.collection("users").doc(userCredential.user!.uid).set(user.toJson(),);
        result = "Success - Your Account has been created.";
      }
      else {
        result = "Error - Something went wrong.";
      }
      // await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      result = "Error - ${SignUpWithEmailAndPasswordFailure.code(e.code).message}";
    } catch(_) {
      result = "Error - ${const SignUpWithEmailAndPasswordFailure().message}";
    }
    return result;
  }

  // EMAIL LOGIN
  Future<String> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String result = "Error - An Unknown error occurred.";
    try {

      if(email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        result = "Success - Your Account has been created.";
        } else {
        result = "Error - Please Enter all the fields.";
      }
      // if (!user.emailVerified) {
      //   await sendEmailVerification(context);
      // }
    } on FirebaseAuthException catch (e) {
      result = "Error - ${LoginWithEmailAndPasswordFailure.code(e.code).message}";
    } catch (_){
      result = "Error - ${const LoginWithEmailAndPasswordFailure().message}";
    }
    return result;
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }


  // GOOGLE SIGN IN
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');

        await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          UserCredential userCredential =
          await _auth.signInWithCredential(credential);

          // if you want to do specific task like storing information in firestore
          // only for new users using google sign in (since there are no two options
          // for google sign in and google sign up, only one as of now),
          // do the following:

          if (userCredential.user != null) {
            if (userCredential.additionalUserInfo!.isNewUser) {}
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }





  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // DELETE ACCOUNT
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }
}
