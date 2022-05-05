import 'package:donor_soul/models/user_common_manager.dart';
import 'package:donor_soul/models/user_institution.dart';
import 'package:donor_soul/models/user_institution_manager.dart';
import 'package:donor_soul/screens/base/base_screen_institution.dart';
import 'package:donor_soul/screens/base/base_screen_user.dart';
import 'package:donor_soul/screens/edit_profile/edit_profile_screen.dart';
import 'package:donor_soul/screens/login/login_screen.dart';
import 'package:donor_soul/screens/register/choose_account_type.dart';
import 'package:donor_soul/screens/register/register_user_common.dart';
import 'package:donor_soul/screens/register/register_user_institution.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DonorSoul());
}

class DonorSoul extends StatelessWidget {
  const DonorSoul({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserCommonManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => UserInstitutionManager(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Donor Soul',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(56, 181, 235, 1),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(56, 181, 235, 1),
            elevation: 0.7,
            centerTitle: true,
          ),
          backgroundColor: const Color.fromRGBO(238, 238, 238, 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // initialRoute: '/login',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/baseUser':
              return MaterialPageRoute(builder: (_) => const BaseScreenUser());
            case '/baseInstitution':
              return MaterialPageRoute(
                  builder: (_) => const BaseScreenInstitution());
            case '/login':
              return MaterialPageRoute(builder: (_) => const LoginScreen());
            case '/register':
              return MaterialPageRoute(
                  builder: (_) => const ChooseAccountType());
            case '/register_user_common':
              return MaterialPageRoute(builder: (_) => RegisterUserCommon());
            case '/register_user_institution':
              return MaterialPageRoute(
                  builder: (_) => const RegisterUserInstitution());
            case '/edit_profile':
              return MaterialPageRoute(
                  builder: (_) => EditProfileScreen(
                        user: settings.arguments as UserInstitution,
                      ));
            default:
              return MaterialPageRoute(builder: (_) => const LoginScreen());
          }
        },
      ),
    );
  }
}
