import 'package:donor_soul/common/gradient.dart';
import 'package:donor_soul/helpers/validators.dart';
import 'package:donor_soul/models/user_common.dart';
import 'package:donor_soul/models/user_common_manager.dart';
import 'package:donor_soul/models/user_institution.dart';
import 'package:donor_soul/models/user_institution_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isUser = false;
  bool isInstitution = false;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const GradientContainer(),
          Center(
            child: Form(
              key: formKey,
              child: Consumer2<UserCommonManager, UserInstitutionManager>(
                builder: (_, userCommonManager, userInstitutionManager, __) {
                  print(userCommonManager.loading);
                  print(userInstitutionManager.loading);
                  return ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    children: [
                      Text(
                        'Selecione o tipo de conta',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isUser = true;
                                isInstitution = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color: isUser == true
                                      ? primaryColor
                                      : Colors.grey[400]!,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Image(
                                    image:
                                        AssetImage('assets/images/doador.png'),
                                    height: 150,
                                    width: 150,
                                  ),
                                  Text(
                                    'Doador',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isUser = false;
                                isInstitution = true;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color: isInstitution == true
                                      ? primaryColor
                                      : Colors.grey[400]!,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Column(
                                children: const [
                                  Image(
                                    image: AssetImage('assets/images/ong.png'),
                                    width: 150,
                                    height: 150,
                                  ),
                                  Text(
                                    'Instituição',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          labelText: 'Email',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          prefixIcon: const Icon(Icons.email_outlined),
                          focusColor: primaryColor,
                        ),
                        enabled: !userCommonManager.loading &&
                            !userInstitutionManager.loading,
                        textAlignVertical: TextAlignVertical.center,
                        controller: emailController,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Campo obrigatório!';
                          } else if (!emailValid(email)) {
                            return 'E-mail inválido';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          labelText: 'Senha',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          prefixIcon: const Icon(Icons.lock_outlined),
                          focusColor: primaryColor,
                        ),
                        obscureText: true,
                        enabled: !userCommonManager.loading &&
                            !userInstitutionManager.loading,
                        textAlignVertical: TextAlignVertical.center,
                        controller: passController,
                        validator: (pass) {
                          if (pass!.isEmpty) {
                            return 'Campo obrigatório';
                          } else if (!passwordValid(pass)) {
                            return 'Senha não é válida';
                          } else {
                            return null;
                          }
                        },
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              // padding: Ed
                              ),
                          onPressed: () {},
                          child: const Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: !isUser && !isInstitution
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  isUser
                                      ? userCommonManager.login(
                                          user: UserCommon(
                                            email: emailController.text,
                                            password: passController.text,
                                          ),
                                          onFail: (e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  e,
                                                  style: const TextStyle(
                                                    fontFamily: 'Montserrat',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          onSuccess: () {
                                            Navigator.of(context).pushNamedAndRemoveUntil('/base', (route) => false);
                                          },
                                        )
                                      : userInstitutionManager.login(
                                          user: UserInstitution(
                                              email: emailController.text,
                                              password: passController.text),
                                          onFail: (e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  e,
                                                  style: const TextStyle(
                                                      fontFamily: 'Montserrat'),
                                                ),
                                              ),
                                            );
                                            return;
                                          },
                                          onSuccess: () {
                                            Navigator.of(context)
                                                .pushReplacementNamed('/base');
                                          });
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                        child: userCommonManager.loading ||
                                userInstitutionManager.loading
                            ? const CircularProgressIndicator(
                                strokeWidth: 5,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : const Text(
                                'Entrar',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Não possui uma conta?',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/register');
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  'Criar',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                      color: primaryColor,
                                      fontSize: 15),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
