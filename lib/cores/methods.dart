import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../features/upload/long_video/details.dart';

void showSnackBar(String message, BuildContext context) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 5),
    ));

Future<File?> pickVideo(context) async {
  final XFile? file =
      await ImagePicker().pickVideo(source: ImageSource.gallery);

  if (file != null) {
    File video = File(file.path);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VideoDetails(video: video)),
    );

    return video;
  } else {
    return null;
  }
}

Future<File?> pickImage() async {
  final XFile? file =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  if (file != null) {
    File image = File(file.path);

    return image;
  } else {
    return null;
  }
}

Future<String> putFileInStorage(file, number, fileType) async {
  final ref = FirebaseStorage.instance.ref().child('$fileType/$number');

  final upload = ref.putFile(file);

  final snapshot = await upload;

  String downloadUrl = await snapshot.ref.getDownloadURL();

  return downloadUrl;
}
