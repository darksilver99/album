// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future insertPhotoToAlbum(
  String? photo,
  String? album,
) async {
  // Add your function code here!
  switch (album) {
    case 'album1':
      FFAppState().addToAlbum1(photo!);
    case 'album2':
      FFAppState().addToAlbum2(photo!);
    case 'album3':
      FFAppState().addToAlbum3(photo!);
    case 'album4':
      FFAppState().addToAlbum4(photo!);
    default:
      print("no album selected");
  }
}
