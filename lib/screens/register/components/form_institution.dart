import 'package:donor_soul/helpers/masks.dart';
import 'package:donor_soul/helpers/states_country.dart';
import 'package:donor_soul/helpers/validators.dart';
import 'package:flutter/material.dart';

class FormInstitution extends StatefulWidget {
  const FormInstitution({Key? key}) : super(key: key);

  @override
  State<FormInstitution> createState() => _FormInstitutionState();
}

class _FormInstitutionState extends State<FormInstitution> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

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
            labelText: 'Nome da instituição',
            labelStyle: const TextStyle(fontFamily: 'Montserrat'),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            prefixIcon: const Icon(Icons.groups_outlined),
            focusColor: primaryColor,
          ),
          textAlignVertical: TextAlignVertical.center,
          validator: (name){
            if(name!.isEmpty){
              return 'Campo obrigatório!';
            } else if(!nameInstitutionValid(name)){
              return 'Nome deve conter ao menos 3 caracteres';
            } else{
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
            labelText: 'Endereço',
            labelStyle: const TextStyle(fontFamily: 'Montserrat'),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            prefixIcon: const Icon(Icons.roofing_outlined),
            focusColor: primaryColor,
          ),
          textAlignVertical: TextAlignVertical.center,
          validator: (location){
            if(location!.isEmpty){
              return 'Campo obrigatório!';
            } else if(!nameAddressValid(location)){
              return 'Preencha seu endereço completo';
            } else{
              return null;
            }
          },
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: DropdownButtonFormField<String>(
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
                hint: const Text('Estado', style: TextStyle(
                  fontFamily: 'Montserrat',
                ),),
                onChanged: (value){
                  setState(() {
                    _selectedValue = value;
                  });
                },
                onSaved: (value){
                  setState(() {
                    _selectedValue = value;
                  });
                },
                validator: (value){
                  if(!stateValid(value)){
                    return 'Selecione um estado!';
                  } else{
                    return null;
                  }
                },
                items: states.map((String val){
                  return DropdownMenuItem(
                    value: val,
                    child: (
                      Text(
                        val, style: const TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                      )
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                inputFormatters: [maskCEP],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  labelText: 'CEP',
                  labelStyle: const TextStyle(fontFamily: 'Montserrat'),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  prefixIcon: const Icon(Icons.place_outlined),
                  focusColor: primaryColor,
                ),
                textAlignVertical: TextAlignVertical.center,
                validator: (cep){
                  if(cep!.isEmpty){
                    return 'Campo obrigatório!';
                  } else if(!cepValid(cep)){
                    return 'CEP deve conter 8 dígitos';
                  } else{
                    return null;
                  }
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            labelText: 'Cidade',
            labelStyle: const TextStyle(fontFamily: 'Montserrat'),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            prefixIcon: const Icon(Icons.location_city_outlined),
            focusColor: primaryColor,
          ),
          textAlignVertical: TextAlignVertical.center,
          validator: (city){
            if(city!.isEmpty){
              return 'Campo obrigatório';
            } else if(!nameCityValid(city)){
              return 'Preencha o nome completo da cidade!';
            } else{
              return null;
            }
          },
        ),
        const SizedBox(height: 15),
        TextFormField(
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
            contentPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            prefixIcon: const Icon(Icons.phone_outlined),
            focusColor: primaryColor,
          ),
          textAlignVertical: TextAlignVertical.center,
          validator: (phone){
            if(phone!.isEmpty){
              return 'Campo obrigatório!';
            } else if(!numberValid(phone)){
              return 'Telefone inválido';
            } else{
              return null;
            }
          },
        ),
        const SizedBox(height: 15),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
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
          validator: (email){
            if(email!.isEmpty){
              return 'Campo obrigatório!';
            } else if(!emailValid(email)){
              return 'Email inválido!';
            } else{
              return null;
            }
          },
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
          validator: (pass){
            if(pass!.isEmpty){
              return 'Campo obrigatório';
            } else if(!passwordValid(pass)){
              return 'Senha deve conter pelo menos 6 caracteres';
            } else{
              return null;
            }
          },
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
          validator: (confirmPass){
            if(confirmPass!.isEmpty){
              return 'Campo obrigatório';
            } else if(!passwordValid(confirmPass)){
              return 'Senha deve conter pelo menos 6 caracteres';
            } else{
              return null;
            }
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
