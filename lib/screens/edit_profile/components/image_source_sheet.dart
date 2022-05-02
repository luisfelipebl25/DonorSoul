import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  ImageSourceSheet({Key? key, required this.onImageSelected}) : super(key: key);

  final Function(File) onImageSelected;

  final ImagePicker _picker = ImagePicker();

  Future<void> editImage(String path) async {
    final File? croppedFile = await ImageCropper().cropImage(
        sourcePath: path,
        aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'Editar Imagem',
          toolbarColor: Color.fromRGBO(34, 34, 46, 1),
          toolbarWidgetColor: Colors.white,
          backgroundColor: Colors.black,
        ));
    if (croppedFile != null) {
      onImageSelected(croppedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () async {
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.camera);
              if (image != null) {
                editImage(image.path);
              }
            },
            child: Text(
              'Câmera',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          const Divider(
            height: 1,
          ),
          TextButton(
            onPressed: () async {
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                editImage(image.path);
              }
            },
            child: Text(
              'Galeria',
              style: TextStyle(color: Colors.grey[700]),
            ),
          )
        ],
      ),
    );
  }
}
