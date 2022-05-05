import 'package:donor_soul/screens/chat/chat_user_screen.dart';
import 'package:donor_soul/screens/feed/feed_screen.dart';
import 'package:donor_soul/screens/settings/settings_user_screen.dart';
import 'package:flutter/material.dart';

class BaseScreenUser extends StatefulWidget {
  const BaseScreenUser({Key? key}) : super(key: key);

  @override
  State<BaseScreenUser> createState() => _BaseScreenUserState();
}

class _BaseScreenUserState extends State<BaseScreenUser> {
  int _index = 0;
  List<Widget> screens = const [
    FeedScreen(),
    ChatUserScreen(),
    SettingsUserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
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
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Feed',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.chat_outlined),
              label: 'Chats',
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings_outlined),
              label: 'Configurações',
              backgroundColor: primaryColor),
        ],
      ),
    );
  }
}
