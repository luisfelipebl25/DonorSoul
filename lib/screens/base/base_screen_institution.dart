import 'package:donor_soul/screens/settings/settings_institution_screen.dart';
import 'package:flutter/material.dart';

class BaseScreenInstitution extends StatefulWidget {
  BaseScreenInstitution({Key? key}) : super(key: key);

  @override
  State<BaseScreenInstitution> createState() => _BaseScreenInstitutionState();
}

class _BaseScreenInstitutionState extends State<BaseScreenInstitution> {
  int _index = 0;
  List<Widget> screens = const [
    Center(
      child: Text('Feed'),
    ),
    Center(
      child: Text('Chats'),
    ),
    SettingsInstitutionScreen(),
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
            backgroundColor: Colors.black12,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined),
              label: 'Chats',
              backgroundColor: Colors.lightGreen),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Configurações',
              backgroundColor: Colors.redAccent),
        ],
      ),
    );
  }
}
