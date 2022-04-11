import 'package:donor_soul/helpers/validators.dart';
import 'package:donor_soul/models/user_common.dart';
import 'package:donor_soul/models/user_common_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormUser extends StatelessWidget {
  FormUser({Key? key}) : super(key: key);

  UserCommon userCommon = UserCommon(email: '', password: '');

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Consumer<UserCommonManager>(
      builder: (_, userCommonManager, __) {
        return ListView(
          shrinkWrap: true,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                labelText: 'Nome completo',
                labelStyle: const TextStyle(fontFamily: 'Montserrat'),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                prefixIcon: const Icon(Icons.person_outline),
                focusColor: primaryColor,
              ),
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                prefixIcon: const Icon(Icons.email_outlined),
                focusColor: primaryColor,
              ),
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                prefixIcon: const Icon(Icons.lock_outlined),
                focusColor: primaryColor,
              ),
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                prefixIcon: const Icon(Icons.lock_outlined),
                focusColor: primaryColor,
              ),
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
          ],
        );
      },
    );
  }
}
