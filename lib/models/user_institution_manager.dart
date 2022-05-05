import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donor_soul/helpers/firebase_errors.dart';
import 'package:donor_soul/models/user_institution.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UserInstitutionManager extends ChangeNotifier {
  UserInstitutionManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserInstitution? user;

  bool _loading = false;

  bool get loading => _loading;

  bool get isLoggedIn => user != null;

  Future<void> login(
      {required UserInstitution user,
      required Function onFail,
      required Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      await _loadCurrentUser(firebaseUser: result.user);

      onSuccess();
    } on FirebaseAuthException catch (e) {
      print(e);
      onFail(getErrorString(e.code));
    }

    loading = false;
  }

  Future<void> register(
      {required UserInstitution user,
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

  Future<void> save() async {
    loading = true;
    final Map<String, dynamic> data = {
      'name': user?.name,
      'address': user?.address,
      'stateCountry': user?.stateCountry,
      'cep': user?.cep,
      'city': user?.city,
      'phone': user?.phone,
      'email': user?.email,
      'emailContact': user?.emailContact,
      'items': user?.items,
    };

    if (user!.id.isEmpty || user?.id == null) {
      final doc = await firestore.collection('users_institution').add(data);
      user?.id = doc.id;
    } else {
      await user?.firestoreRef.update(data);
    }

    final List<String> updateImages = [];

    for (final newImage in user!.newImages!) {
      if (user!.images.contains(newImage)) {
        updateImages.add(newImage as String);
      } else {
        final UploadTask task =
            user!.storageRef.child(Uuid().v1()).putFile(newImage as File);
        final TaskSnapshot snapshot = await task.whenComplete(() => null);
        final String url = await snapshot.ref.getDownloadURL();
        updateImages.add(url);
      }
    }

    for (final image in user!.images) {
      if (!user!.newImages!.contains(image)) {
        try {
          final ref = await user!.storage.refFromURL(image);
          await ref.delete();
        } catch (e) {
          print('Falha ao deletar $image');
        }
      }
    }

    await user!.firestoreRef.update({'images': updateImages});

    user!.images = updateImages;
    print(loading);
    loading = false;
  }

  void handleTimeOut() {
    Timer(const Duration(seconds: 5), () => loading = false);
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signOut() async {
    auth.signOut();
    user = null;
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
