import 'package:donor_soul/models/user_common_manager.dart';
import 'package:donor_soul/models/user_institution_manager.dart';
import 'package:donor_soul/screens/base/base_screen.dart';
import 'package:donor_soul/screens/feed/feed_screen.dart';
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
  // FirebaseFirestore.instance.collection('teste').add({'teste': 'teste2'});

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
        )
      ],
      child: MaterialApp(
        title: 'Donor Soul',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(56, 181, 235, 1),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(56, 181, 235, 1),
            elevation: 0,
            centerTitle: true,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/base':
              return MaterialPageRoute(builder: (_) => BaseScreen());
            case '/login':
              return MaterialPageRoute(builder: (_) => const LoginScreen());
            case '/register':
              return MaterialPageRoute(
                  builder: (_) => const ChooseAccountType());
            case '/register_user_common':
              return MaterialPageRoute(builder: (_) => RegisterUserCommon());
            case '/register_user_institution':
              return MaterialPageRoute(
                  builder: (_) => RegisterUserInstitution());
            case '/feed':
              return MaterialPageRoute(builder: (_) => const FeedScreen());
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}
