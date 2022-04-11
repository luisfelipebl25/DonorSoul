import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          // const FeedScreen(),
          Scaffold(
            appBar: AppBar(
              title: const Text('Feeed'),
              backgroundColor: Colors.red,
            ),
          ),
          Scaffold(
            appBar: AppBar(
              title: const Text('Chats'),
            ),
            backgroundColor: Colors.blue,
          ),
          Scaffold(
            appBar: AppBar(
              title: const Text('Configurações'),
            ),
            backgroundColor: Colors.yellow,
          ),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageController,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            currentIndex: pageController.page?.round() ?? 0,
            onTap: (index){
              pageController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feeeed'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_outlined), label: 'Chats'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: 'Opções'),
            ],

          );
        }
      ),
    );
  }
}
