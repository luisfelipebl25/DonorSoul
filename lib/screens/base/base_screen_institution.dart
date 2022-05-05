import 'package:donor_soul/screens/chat/chat_institution_screen.dart';
import 'package:donor_soul/screens/profile/profile_screen.dart';
import 'package:donor_soul/screens/settings/settings_institution_screen.dart';
import 'package:flutter/material.dart';

class BaseScreenInstitution extends StatefulWidget {
  const BaseScreenInstitution({Key? key}) : super(key: key);

  @override
  State<BaseScreenInstitution> createState() => _BaseScreenInstitutionState();
}

class _BaseScreenInstitutionState extends State<BaseScreenInstitution> {
  int _index = 0;
  List<Widget> screens = const [
    ProfileScreen(),
    ChatInstitutionScreen(),
    SettingsInstitutionScreen(),
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
            icon: const Icon(Icons.person),
            label: 'Perfil',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_outlined),
            label: 'Chats',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            label: 'Configurações',
            backgroundColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
