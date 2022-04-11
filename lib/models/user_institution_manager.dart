import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donor_soul/helpers/firebase_errors.dart';
import 'package:donor_soul/models/user_institution.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInstitutionManager extends ChangeNotifier {
  UserInstitutionManager() {
    // _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserInstitution? user;

  bool _loading = false;

  bool get loading => _loading;

  bool get isLoggedIn => user != null;

  Future<void> login({required UserInstitution user,
    required Function onFail,
    required Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      user.id = result.user!.uid;
      this.user = user;

      await user.saveData();

      onSuccess();
    } on FirebaseAuthException catch (e) {
      print(e);
      onFail(getErrorString(e.code));
    }

    loading = false;
  }

  Future<void> register({required UserInstitution user,
    required Function onFail,
    required Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
        email: user.email, password: user.confirmPassword,);

      user.id = result.user!.uid;
      this.user = user;

      await user.saveData();

      onSuccess();
    } on FirebaseAuthException catch (e) {
      print(e);
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({User? firebaseUser}) async {
    final User? currentUser = firebaseUser ?? auth.currentUser;
    if (currentUser != null) {
      final DocumentSnapshot docUser = await firestore
          .collection('users_institution')
          .doc(currentUser.uid)
          .get();
      user = UserInstitution.fromDocument(docUser);

      notifyListeners();
    }
  }
}
