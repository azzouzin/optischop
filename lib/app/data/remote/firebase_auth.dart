import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getx_skeleton/app/data/remote/firestore_db.dart';
import 'package:getx_skeleton/utils/constants.dart';
import 'package:logger/logger.dart';

import '../models/user_model.dart';

class AuthServices {

  User? checkCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      //   Logger().i(user.email);
    } else {
      // Logger().w("FireBase User = NULL");
    }
    return user;
  }



  Future<UserModel> signin(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email + "@gmail.com",
        password: password,
      );

      return await fetchUserData(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Logger().e('Wrong password provided for that user.');
      }
      rethrow; // Rethrow the exception to be handled by your app
    }
  }

  Future<UserModel> fetchUserData(String userId) async {
    // Logger().i(userId);

    return await FirebaseFirestore.instance
        .collection(Constants.usersCollection)
        .where("uid", isEqualTo: userId)
        .get()
        .then((value) {
      return UserModel.fromMap(value.docs.first.data());
    }).catchError((error) {
      Logger().e('Error fetching user data: $error');
      throw error;
    });
  }

  Future changePassword(String newPassword, String oldPassword) async {
    try {
      User user = FirebaseAuth.instance.currentUser!;
      await user.reauthenticateWithCredential(
        EmailAuthProvider.credential(
          email: user.email!,
          password: oldPassword,
        ),
      );
      await user.updatePassword(newPassword);
      // Password updated successfully!
      Logger().i('Password updated successfully!');
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }


}