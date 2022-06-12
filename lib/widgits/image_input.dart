import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as sys_path;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  const ImageInput(this.onSelectImage, {Key? key}) : super(key: key);

  final Function onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final imagepicker = ImagePicker();

    final imageFile = await imagepicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (imageFile == null) return;

    final imageParth = imageFile.path;
    final appDir = await sys_path.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageParth);

    final savedImage = await imageFile.saveTo('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);

    // setState(() {
    //   _storedImage = File(path);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton.icon(
          onPressed: _takePicture,
          icon: const Icon(Icons.camera_alt),
          label: const Text("Take Picture"),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          alignment: Alignment.center,
          child: _storedImage == null
              ? const Text("No Image Taken")
              : Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        )
      ],
    );
  }
}
