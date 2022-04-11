import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donor_soul/helpers/firebase_errors.dart';
import 'package:donor_soul/models/user_common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserCommonManager extends ChangeNotifier {

  UserCommonManager(){
    // _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserCommon? user;

  bool _loading = false;

  bool get loading => _loading;

  bool get isLoggedIn => user != null;

  Future<void> login({required UserCommon user,
    required Function onFail,
    required Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      await _loadCurrentUser(firebaseUser: result.user);

      onSuccess();
    } on FirebaseAuthException catch(e){
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  Future<void> register({required UserCommon user,
    required Function onFail,
    required Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.confirmPassword,
      );

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

  Future<void> _loadCurrentUser({User? firebaseUser}) async{
    final User? currentUser = firebaseUser ?? auth.currentUser;
    if(currentUser != null){
      final DocumentSnapshot docUser = await firestore.collection('users_common').doc(currentUser.uid).get();
      user = UserCommon.fromDocument(docUser);

      notifyListeners();
    }
  }

}
