// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:io';

Future dowloadImage(String? photoPath) async {
  // Add your function code here!
  final file = File(photoPath!);
  Uint8List bytes = await file.readAsBytes();
  await ImageGallerySaver.saveImage(bytes);
}
