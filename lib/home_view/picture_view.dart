import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class UpLodeImage extends StatefulWidget {
  const UpLodeImage({super.key,required });

  @override
  State<UpLodeImage> createState() => _UpLodeImageState();
}

class _UpLodeImageState extends State<UpLodeImage> {
  File? image;
  final imagePicker = ImagePicker();
  Future<void> uplodeImageInCamra() async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    });
  }

  Future<void> uplodeImageInGalry() async {
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Select Image Source'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        uplodeImageInCamra();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Take a Photo'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        uplodeImageInGalry();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Choose from Gallery'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(100),
        child: Center(
          child: image == null
              ? const CircleAvatar(
                  radius: 75,
                  child: Icon(Icons.camera_alt_outlined),
                )
              : Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(image!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(300),
                  ),
                ),
        ),
      ),
    );
  }
}