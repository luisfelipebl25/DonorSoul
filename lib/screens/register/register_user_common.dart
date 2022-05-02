import 'package:donor_soul/common/gradient.dart';
import 'package:donor_soul/helpers/validators.dart';
import 'package:donor_soul/models/user_common.dart';
import 'package:donor_soul/models/user_common_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterUserCommon extends StatelessWidget {
  RegisterUserCommon({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UserCommon userCommon = UserCommon(email: '', password: '');

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastrar Doador',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          const GradientContainer(),
          Form(
            key: formKey,
            child: Consumer<UserCommonManager>(
              builder: (_, userCommonManager, __) {
                return ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Image(
                      image: AssetImage('assets/images/doador_borded.png'),
                      height: 150,
                      width: 150,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        labelText: 'Nome completo',
                        labelStyle: const TextStyle(fontFamily: 'Montserrat'),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        prefixIcon: const Icon(Icons.person_outline),
                        focusColor: primaryColor,
                      ),
                      enabled: !userCommonManager.loading,
                      textAlignVertical: TextAlignVertical.center,
                      validator: (name) {
                        if (name!.isEmpty) {
                          return 'Campo obrigatório!';
                        } else if (!nameComplete(name)) {
                          return 'Insira seu nome completo!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (name) => userCommon.name = name!,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        labelText: 'E-mail',
                        labelStyle: const TextStyle(fontFamily: 'Montserrat'),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        prefixIcon: const Icon(Icons.email_outlined),
                        focusColor: primaryColor,
                      ),
                      enabled: !userCommonManager.loading,
                      textAlignVertical: TextAlignVertical.center,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'Campo obrigatório!';
                        } else if (!emailValid(email)) {
                          return email;
                        } else {
                          return null;
                        }
                      },
                      onSaved: (email) => userCommon.email = email!,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      obscureText: true,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        labelText: 'Senha',
                        labelStyle: const TextStyle(fontFamily: 'Montserrat'),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        prefixIcon: const Icon(Icons.lock_outlined),
                        focusColor: primaryColor,
                      ),
                      enabled: !userCommonManager.loading,
                      textAlignVertical: TextAlignVertical.center,
                      validator: (pass) {
                        if (pass!.isEmpty) {
                          return 'Campo obrigatório!';
                        } else if (!passwordValid(pass)) {
                          return 'Senha deve conter pelo menos 6 caracteres!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (pass) => userCommon.password = pass!,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      obscureText: true,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        labelText: 'Repita sua senha',
                        labelStyle: const TextStyle(fontFamily: 'Montserrat'),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        prefixIcon: const Icon(Icons.lock_outlined),
                        focusColor: primaryColor,
                      ),
                      enabled: !userCommonManager.loading,
                      textAlignVertical: TextAlignVertical.center,
                      validator: (confirmPass) {
                        if (confirmPass!.isEmpty) {
                          return 'Campo obrigatório!';
                        } else if (!passwordValid(confirmPass)) {
                          return 'Senha deve conter pelo menos 6 caracteres!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (confirmPass) =>
                          userCommon.confirmPassword = confirmPass!,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          if (userCommon.password !=
                              userCommon.confirmPassword) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Senhas não coincidem!',
                                  style: TextStyle(fontFamily: 'Montserrat'),
                                ),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 1),
                              ),
                            );
                            return;
                          }
                          userCommonManager.register(
                            user: userCommon,
                            onFail: (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    e,
                                    style: const TextStyle(
                                        fontFamily: 'Montserrat'),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            onSuccess: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Conta criada com sucesso!',
                                    style: TextStyle(fontFamily: 'Montserrat'),
                                  ),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                              Navigator.of(context).popUntil((route) => false);
                            },
                          );
                        }
                      },
                      child: userCommonManager.loading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                              strokeWidth: 5,
                            )
                          : const Text(
                              'Cadastrar',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        onSurface: primaryColor.withAlpha(100),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
