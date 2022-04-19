import 'package:donor_soul/screens/settings/settings_user_screen.dart';
import 'package:flutter/material.dart';

class BaseScreenUser extends StatefulWidget {
  BaseScreenUser({Key? key}) : super(key: key);

  @override
  State<BaseScreenUser> createState() => _BaseScreenUserState();
}

class _BaseScreenUserState extends State<BaseScreenUser> {
  int _index = 0;
  List<Widget> screens = const [
    Center(
      child: Text('Feed'),
    ),
    Center(
      child: Text('Chats'),
    ),
    SettingsUserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: screens,
        index: _index,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined),
              label: 'Chats',
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Configurações',
              backgroundColor: Colors.pinkAccent),
        ],
      ),
    );
  }
}
