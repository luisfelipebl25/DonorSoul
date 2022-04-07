import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donor_soul/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.collection('teste').add({'teste': 'teste2'});

  runApp(const DonorSoul());
}

class DonorSoul extends StatelessWidget {
  const DonorSoul({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(56, 181, 235, 1),
          ),
      home: LoginScreen(),
    );
  }
}
