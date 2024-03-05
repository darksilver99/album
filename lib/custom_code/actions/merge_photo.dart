// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

Future mergePhoto(dynamic photo) async {
  // Add your function code here!
  final bytes = await photo.capture();
  final directory = await getTemporaryDirectory();
  final appDir = path.join(directory.path, 'com.silver.album');
  await Directory(appDir).create(recursive: true);

  final filePath = path.join(appDir,
      '${DateTime.now().toString().replaceAll(" ", "").replaceAll(":", "").replaceAll(" ", "").replaceAll(".", "")}.png');
  final file = File(filePath);
  await file.writeAsBytes(bytes!);
  FFAppState().update(() {
    FFAppState().addToQuartPhotoList(filePath);
  });
}
