import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isUser = false;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(242, 242, 242, 1),
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(232, 232, 233, 1),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  'Escolha o tipo de conta',
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
                        });
                        print(isUser);
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
                              image: AssetImage('assets/images/doador.png'),
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
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: isUser == false
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    prefixIcon: Icon(Icons.email_outlined),
                    focusColor: primaryColor,
                  ),
                  textAlignVertical: TextAlignVertical.center,
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    prefixIcon: Icon(Icons.lock_outlined),
                    focusColor: primaryColor,
                  ),
                  textAlignVertical: TextAlignVertical.center,
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
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
                        onTap: () {},
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
            ),
          )
        ],
      ),
    );
  }
}
