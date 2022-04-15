import 'package:flutter/material.dart';

import '../settings/settings_user_screen.dart';

class BaseScreenInstitution extends StatelessWidget {
  BaseScreenInstitution({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text('Feed'),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: const Text('Chats'),
            ),
          ),
          const SettingsUserScreen(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              elevation: 0,
              currentIndex: pageController.page?.round() ?? 0,
              onTap: (index) {
                pageController.jumpToPage(index);
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_outlined), label: 'Chats'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                ),
              ],
            );
          }),
    );
  }
}
