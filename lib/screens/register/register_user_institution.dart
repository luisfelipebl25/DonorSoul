import 'package:donor_soul/common/gradient.dart';
import 'package:donor_soul/helpers/regexs.dart';
import 'package:donor_soul/helpers/validators.dart';
import 'package:donor_soul/models/user_institution.dart';
import 'package:donor_soul/models/user_institution_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/masks.dart';
import '../../helpers/states_country.dart';

class RegisterUserInstitution extends StatefulWidget {
  const RegisterUserInstitution({Key? key}) : super(key: key);

  @override
  State<RegisterUserInstitution> createState() =>
      _RegisterUserInstitutionState();
}

class _RegisterUserInstitutionState extends State<RegisterUserInstitution> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _selectedValue;
  UserInstitution userInstitution = UserInstitution(email: '', password: '');

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastrar Instituição',
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
            child: Consumer<UserInstitutionManager>(
              builder: (_, userInstitutionManager, __) {
                return ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Image(
                      image: AssetImage('assets/images/ong_bordered_2.png'),
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
                        labelText: 'Nome da instituição',
                        labelStyle: const TextStyle(fontFamily: 'Montserrat'),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        prefixIcon: const Icon(Icons.groups_outlined),
                        focusColor: primaryColor,
                      ),
                      enabled: !userInstitutionManager.loading,
                      textAlignVertical: TextAlignVertical.center,
                      validator: (name) {
                        if (name!.isEmpty) {
                          return 'Campo obrigatório!';
                        } else if (!nameInstitutionValid(name)) {
                          return 'Nome deve conter ao menos 3 caracteres';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (name) => userInstitution.name = name!,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        labelText: 'Endereço',
                        labelStyle: const TextStyle(fontFamily: 'Montserrat'),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        prefixIcon: const Icon(Icons.roofing_outlined),
                        focusColor: primaryColor,
                      ),
                      enabled: !userInstitutionManager.loading,
                      textAlignVertical: TextAlignVertical.center,
                      validator: (address) {
                        if (address!.isEmpty) {
                          return 'Campo obrigatório!';
                        } else if (!nameAddressValid(address)) {
                          return 'Preencha seu endereço completo';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (address) => userInstitution.address = address!,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: IgnorePointer(
                            ignoring: userInstitutionManager.loading,
                            child: DropdownButtonFormField<String>(
                              menuMaxHeight: 300.0,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                contentPadding: EdgeInsets.only(
                                    top: 5, bottom: 5, right: 5),
                                prefixIcon: Icon(Icons.place_outlined),
                              ),
                              value: _selectedValue,
                              hint: const Text(
                                'Estado',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                              onSaved: (value) {
                                setState(() {
                                  _selectedValue = value;
                                });
                              },
                              validator: (value) {
                                if (!stateValid(value)) {
                                  return 'Selecione um estado!';
                                } else {
                                  return null;
                                }
                              },
                              items: states.map((String val) {
                                return DropdownMenuItem(
                                  enabled: !userInstitutionManager.loading,
                                  value: val,
                                  child: (Text(
                                    val,
                                    style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                    ),
                                  )),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            enabled: !userInstitutionManager.loading,
                            inputFormatters: [maskCEP],
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              labelText: 'CEP',
                              labelStyle:
                                  const TextStyle(fontFamily: 'Montserrat'),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              prefixIcon: const Icon(Icons.place_outlined),
                              focusColor: primaryColor,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            validator: (cep) {
                              if (cep!.isEmpty) {
                                return 'Campo obrigatório!';
                              } else if (!cepValid(cep)) {
                                return 'CEP deve conter 8 dígitos';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (cep) =>
                                userInstitution.cep = onlyNumbers(cep!),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        enabled: !userInstitutionManager.loading,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        labelText: 'Cidade',
                        labelStyle: const TextStyle(fontFamily: 'Montserrat'),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        prefixIcon: const Icon(Icons.location_city_outlined),
                        focusColor: primaryColor,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      validator: (city) {
                        if (city!.isEmpty) {
                          return 'Campo obrigatório';
                        } else if (!nameCityValid(city)) {
                          return 'Preencha o nome completo da cidade!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (city) => userInstitution.city = city!,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      enabled: !userInstitutionManager.loading,
                      inputFormatters: [maskPhone],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        labelText: 'Telefone',
                        labelStyle: const TextStyle(fontFamily: 'Montserrat'),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        prefixIcon: const Icon(Icons.phone_outlined),
                        focusColor: primaryColor,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      validator: (phone) {
                        if (phone!.isEmpty) {
                          return 'Campo obrigatório!';
                        } else if (!numberValid(phone)) {
                          return 'Telefone inválido';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (phone) =>
                          userInstitution.phone = onlyNumbers(phone!),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      enabled: !userInstitutionManager.loading,
                      keyboardType: TextInputType.emailAddress,
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
                      textAlignVertical: TextAlignVertical.center,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'Campo obrigatório!';
                        } else if (!emailValid(email)) {
                          return 'Email inválido!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (email) => userInstitution.email = email!,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      enabled: !userInstitutionManager.loading,
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
                      textAlignVertical: TextAlignVertical.center,
                      validator: (pass) {
                        if (pass!.isEmpty) {
                          return 'Campo obrigatório';
                        } else if (!passwordValid(pass)) {
                          return 'Senha deve conter pelo menos 6 caracteres';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (pass) => userInstitution.password = pass!,
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
                      textAlignVertical: TextAlignVertical.center,
                      enabled: !userInstitutionManager.loading,
                      validator: (confirmPass) {
                        if (confirmPass!.isEmpty) {
                          return 'Campo obrigatório';
                        } else if (!passwordValid(confirmPass)) {
                          return 'Senha deve conter pelo menos 6 caracteres';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (confirmPass) =>
                          userInstitution.confirmPassword = confirmPass!,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          userInstitution.stateCountry = _selectedValue!;
                          if (userInstitution.password !=
                              userInstitution.confirmPassword) {
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
                          userInstitutionManager.register(
                            user: userInstitution,
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
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/login', (route) => false);
                            },
                          );
                        }
                      },
                      child: userInstitutionManager.loading
                          ? const CircularProgressIndicator(
                              strokeWidth: 5,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
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
