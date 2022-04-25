import 'package:flutter/material.dart';

class ChatUserScreen extends StatelessWidget {
  const ChatUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: kToolbarHeight,
          child: Image.asset('assets/images/logo1.png'),
        ),
      ),
    );
  }
}
