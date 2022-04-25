import 'package:flutter/material.dart';

class ChatInstitutionScreen extends StatelessWidget {
  const ChatInstitutionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo-black1.png',
          width: 250,
        ),
      ),
    );
  }
}
