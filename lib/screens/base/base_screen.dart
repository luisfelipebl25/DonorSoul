import 'package:donor_soul/models/user_common_manager.dart';
import 'package:donor_soul/models/user_institution_manager.dart';
import 'package:donor_soul/screens/settings/settings_institution_screen.dart';
import 'package:donor_soul/screens/settings/settings_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserCommonManager, UserInstitutionManager>(
        builder: (_, userCommonManager, userInstitutionManager, __) {
      return (Scaffold(
        body: userCommonManager.isLoggedIn
            ? PageView(
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
              )
            : userInstitutionManager.isLoggedIn
                ? PageView(
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
                  )
                : Container(),
        bottomNavigationBar: AnimatedBuilder(
            animation: pageController,
            builder: (context, snapshot) {
              return userCommonManager.isLoggedIn
                  ? BottomNavigationBar(
                      elevation: 0,
                      currentIndex: pageController.page?.round() ?? 0,
                      onTap: (index) {
                        pageController.jumpToPage(index);
                      },
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: 'Feed'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.chat_outlined), label: 'Chats'),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.settings_outlined),
                          // label: 'Configurações'),
                        )
                      ],
                    )
                  : userInstitutionManager.isLoggedIn
                      ? BottomNavigationBar(
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
                        )
                      : Container();
            }),
      ));
    });
  }
}
