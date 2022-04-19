import 'package:donor_soul/models/user_common_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsUserScreen extends StatelessWidget {
  const SettingsUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurações',
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      body: Consumer<UserCommonManager>(
        builder: (_, userCommonManager, __) {
          return ListView(
            shrinkWrap: true,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/login');
                  userCommonManager.signOut();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Expanded(
                    child: Row(
                      children: const [
                        Icon(Icons.logout),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Sair',
                          style:
                              TextStyle(fontFamily: 'Montserrat', fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                height: 2.5,
                thickness: 1.5,
              )
            ],
          );
        },
      ),
    );
  }
}
