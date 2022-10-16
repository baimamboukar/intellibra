// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StorageServices {
  final Reader _read;
  StorageServices(
    this._read,
  );
  final ref = FirebaseStorage.instance.ref();

  Future<String> getImageLink(String path) async {
    final imageRef = ref.child('awareness_images/$path');
    String link = '';
    try {
      link = await imageRef.getDownloadURL();
    } on FirebaseException catch (e) {
      
      SnackBar(
        content: Text("the message: ${e.message}"),
        duration: Duration(seconds: 3),

      );
    }
    return link;
  }
}
