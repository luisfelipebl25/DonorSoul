import 'package:flutter/material.dart';

import '../settings/settings_institution_screen.dart';

class BaseScreenUser extends StatelessWidget {
  BaseScreenUser({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('Perfil'),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: const Text('Chats'),
            ),
          ),
          const SettingsInstitutionScreen(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              currentIndex: pageController.page?.round() ?? 0,
              onTap: (index) {
                pageController.jumpToPage(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 26,
                    ),
                    label: 'Feed'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.chat_outlined,
                      size: 26,
                    ),
                    label: 'Chats'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 26,
                    ),
                    label: 'Opções'),
              ],
            );
          }),
    );
  }
}
