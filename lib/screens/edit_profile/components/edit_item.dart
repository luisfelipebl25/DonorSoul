import 'package:donor_soul/models/user_institution_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/validators.dart';

class EditItem extends StatelessWidget {
  EditItem({Key? key, required this.item, required this.onPressed})
      : super(key: key);

  String item;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Consumer<UserInstitutionManager>(
                builder: (_, userInstitutionManager, __) {
                  return TextFormField(
                      initialValue: item,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 10, right: 10),
                          labelText: 'Item',
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
                      validator: (item) {
                        if (!itemValid(item!)) {
                          return 'Item inválido!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (_item) {
                        userInstitutionManager.user?.items
                            .removeWhere((element) => element == '');
                        userInstitutionManager.user?.items
                            .removeWhere((element) => element == _item);
                        userInstitutionManager.user?.items.add(_item!);
                      });
                },
              ),
            ),
            IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.remove_circle_outline),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
