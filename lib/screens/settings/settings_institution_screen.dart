import 'package:donor_soul/models/user_institution_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsInstitutionScreen extends StatelessWidget {
  const SettingsInstitutionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo-black1.png',
          width: 250,
        ),
      ),
      body: Consumer<UserInstitutionManager>(
        builder: (_, userInstitutionManager, __) {
          return ListView(
            shrinkWrap: true,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                  userInstitutionManager.signOut();
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
