import 'package:donor_soul/screens/edit_profile/components/edit_item.dart';
import 'package:flutter/material.dart';

import '../../../models/user_institution.dart';

class ItemsForm extends StatelessWidget {
  ItemsForm({Key? key, required this.user}) : super(key: key);

  final UserInstitution user;
  List<String> newItems = [];

  @override
  Widget build(BuildContext context) {
    return FormField<List<String>>(
      validator: (items) {
        if (items!.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'Insira ao menos um item',
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
            backgroundColor: Colors.white,
            duration: Duration(seconds: 2),
          ));
        } else {
          return null;
        }
      },
      initialValue: user.items,
      builder: (state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Items',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    state.value!.add('');
                    state.didChange(state.value);
                  },
                  icon: Icon(
                    Icons.add_circle_outlined,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Column(
              children: (state.value!.map((item) {
                return EditItem(
                  item: item,
                  onPressed: () {
                    state.value?.remove(item);
                    state.didChange(state.value);
                  },
                );
              })).toList(),
            )
          ],
        );
      },
    );
  }
}
