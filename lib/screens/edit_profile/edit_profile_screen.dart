import 'package:donor_soul/helpers/masks.dart';
import 'package:donor_soul/helpers/validators.dart';
import 'package:donor_soul/models/user_institution.dart';
import 'package:donor_soul/models/user_institution_manager.dart';
import 'package:donor_soul/screens/edit_profile/components/items_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/states_country.dart';
import 'components/images_form.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key, required this.user}) : super(key: key);

  UserInstitution user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    String? _selectedValue = widget.user.stateCountry;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editar Perfil',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              ImagesForm(user: widget.user),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      initialValue: widget.user.name,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 10, right: 10),
                          labelText: 'Nome da instituição',
                          labelStyle: const TextStyle(
                              fontFamily: 'Montserrat', fontSize: 15),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                              ),
                              gapPadding: 05,
                              borderRadius: BorderRadius.circular(5))),
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.start,
                      validator: (name) {
                        if (!nameInstitutionValid(name!)) {
                          return 'Nome muito curto!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (name) => widget.user.name = name!,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: widget.user.description,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 10, right: 10),
                          labelText: 'Descrição',
                          labelStyle: const TextStyle(
                              fontFamily: 'Montserrat', fontSize: 15),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                              ),
                              gapPadding: 05,
                              borderRadius: BorderRadius.circular(5))),
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.start,
                      validator: (description) {
                        if (!descriptionValid(description!)) {
                          return 'Descrição muito curta!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (description) =>
                          widget.user.description = description!,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: widget.user.address,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 10, right: 10),
                          labelText: 'Endereço completo',
                          labelStyle: const TextStyle(
                              fontFamily: 'Montserrat', fontSize: 15),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                              ),
                              gapPadding: 05,
                              borderRadius: BorderRadius.circular(5))),
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.start,
                      validator: (address) {
                        if (!nameAddressValid(address!)) {
                          return 'Endereço inválido!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (address) => widget.user.address = address!,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DropdownButtonFormField<String>(
                      menuMaxHeight: 300.0,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        contentPadding:
                            EdgeInsets.only(top: 5, bottom: 5, right: 5),
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
                          enabled: true,
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
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: widget.user.city,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 10, right: 10),
                          labelText: 'Cidade',
                          labelStyle: const TextStyle(
                              fontFamily: 'Montserrat', fontSize: 15),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                              ),
                              gapPadding: 05,
                              borderRadius: BorderRadius.circular(5))),
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.start,
                      validator: (city) {
                        if (!nameCityValid(city!)) {
                          return 'Cidade inválida!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (city) => widget.user.city = city!,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: maskCEP.maskText(widget.user.cep),
                      inputFormatters: [maskCEP],
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 10, right: 10),
                          labelText: 'CEP',
                          labelStyle: const TextStyle(
                              fontFamily: 'Montserrat', fontSize: 15),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                              ),
                              gapPadding: 05,
                              borderRadius: BorderRadius.circular(5))),
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.start,
                      validator: (cep) {
                        if (!cepValid(cep!)) {
                          return 'CEP inválido!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (cep) =>
                          widget.user.cep = maskCEP.unmaskText(cep!),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: maskPhone.maskText(widget.user.phone),
                      inputFormatters: [maskPhone],
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 10, right: 10),
                          labelText: 'Telefone',
                          labelStyle: const TextStyle(
                              fontFamily: 'Montserrat', fontSize: 15),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                              ),
                              gapPadding: 05,
                              borderRadius: BorderRadius.circular(5))),
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.start,
                      validator: (phone) {
                        if (!numberValid(phone!)) {
                          return 'Telefone inválido!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (phone) =>
                          widget.user.phone = maskPhone.unmaskText(phone!),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: widget.user.emailContact,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 10, right: 10),
                          labelText: 'E-mail para contato',
                          labelStyle: const TextStyle(
                              fontFamily: 'Montserrat', fontSize: 15),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,
                              ),
                              gapPadding: 05,
                              borderRadius: BorderRadius.circular(5))),
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.start,
                      validator: (email) {
                        if (!emailValid(email!)) {
                          return 'Email inválido!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (email) => widget.user.emailContact = email!,
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    ItemsForm(user: widget.user),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<UserInstitutionManager>(
                      builder: (_, userInstitutionManager, __) {
                        return ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              widget.user.stateCountry = _selectedValue!;
                              print(widget.user);
                              print(userInstitutionManager.user);
                            }
                          },
                          child: const Text(
                            'Salvar',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              primary: primaryColor),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
