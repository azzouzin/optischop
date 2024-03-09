import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

import '../models/user_model.dart';

class AuthServices {
  User? checkCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Logger().i(user.email);
    } else {
      Logger().w("FireBase USer = NULL");
    }
    return user;
  }

  // SignUp with password and gmail
  Future<UserCredential> signup(UserModel appUser) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: appUser.email!, password: appUser.password!);
      registerUserInfo(userCredential, appUser);
      Logger().i(userCredential.credential?.token);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().e('The account already exists for that email.');
      }
      rethrow; // Rethrow the exception to be handled by your app
    }
  }

// Register User Info in database after signup
  Future registerUserInfo(
      UserCredential userCredential, UserModel appUser) async {
    appUser.id = userCredential.user!.uid;

    // Create a new document in Firestore with the user's information
    await FirebaseFirestore.instance
        .collection('users')
        .doc(appUser.id)
        .set(appUser.toMap());
  }

  Future<UserModel?> signin(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

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

  Future<bool> signout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();
      // Navigate to the login screen or other appropriate UI
      return true;
    } on FirebaseAuthException catch (e) {
      // Handle exception appropriately (e.g., display an error message)
      print('Error signing out: ${e.code}');
      rethrow;
    }
  }

  Future<UserModel?> fetchUserData(String userId) async {
    Logger().i(userId);

    return await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        UserModel userData =
            UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
        // Use the fetched user data here
        print('User data: $userData');
        return userData;
      } else {
        Logger().e('User document does not exist');
        return null;
      }
    }) /*.catchError((error) {
      Logger().e('Error fetching user data: $error');
      return null;
    })*/
        ;
  }
}
/*.catchError((error) {
      Logger().e('Error fetching user data: $error');
      return null;
    });
  */