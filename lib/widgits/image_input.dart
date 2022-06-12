import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton.icon(
          onPressed: () {},
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
