import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:donor_soul/models/user_institution.dart';
import 'package:donor_soul/screens/edit_profile/components/image_source_sheet.dart';
import 'package:flutter/material.dart';

class ImagesForm extends StatelessWidget {
  const ImagesForm({Key? key, required this.user}) : super(key: key);

  final UserInstitution user;

  @override
  Widget build(BuildContext context) {
    return FormField<List<dynamic>>(
      initialValue: List.from(user.images as dynamic),
      validator: (images) {
        if (images!.isEmpty) {
          return 'Insira ao menos uma imagem';
        } else {
          return null;
        }
      },
      builder: (state) {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 350,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
              ),
              items: state.value!.map<Widget>((image) {
                return Container(
                  color: Theme.of(context).backgroundColor,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (image is String)
                        Image.network(
                          image,
                          fit: BoxFit.cover,
                        )
                      else
                        Image.file(
                          image as File,
                          fit: BoxFit.cover,
                        ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          color: Colors.red,
                          onPressed: () {
                            state.value!.remove(image);
                            state.didChange(state.value);
                          },
                        ),
                      )
                    ],
                  ),
                );
              }).toList()
                ..add(
                  Container(
                    color: Theme.of(context).backgroundColor,
                    width: 350,
                    child: Material(
                      child: IconButton(
                        icon: Icon(
                          Icons.add_a_photo_outlined,
                          color: Theme.of(context).primaryColor,
                          size: 40,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => ImageSourceSheet(
                              onImageSelected: (File file) {
                                state.value!.add(file);
                                state.didChange(state.value);
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
            ),
            if (state.hasError)
              Container(
                margin: const EdgeInsets.only(top: 8, left: 16),
                alignment: Alignment.centerLeft,
                child: Text(
                  state.errorText!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
