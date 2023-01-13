import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickService {
  static Future<File?> pickImage(
      ImageSource source, BuildContext context) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);

      if (image == null) return null;

      final imagePermanent = await saveImagePermanently(image.path);
      return imagePermanent;
    } on PlatformException catch (e) {
      throw Future.error('Failed to pick image: $e');
    }
  }

  static Future<File> saveImagePermanently(String imagePath) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String pathName = path.basename(imagePath);
    final File image = File('${directory.path}/$pathName');
    return File(imagePath).copy(image.path);
  }
}

class DocumentPickService {
// Picks a new PDF document from the Internet/Network
  static Future<File?> pickDocumentFromNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    return _storeFile(url, bytes);
  }

  static Future<File?> _storeFile(String url, List<int> bytes) async {
    final filename = path.basename(url);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

// Picks a new PDF document from the device
  static Future<File?> pickDocumentFromFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['pdf'],
      );
      if (result == null) return null;
      return File(result.paths.first!);
    } catch (e) {
      return Future.error(e);
    }
  }
}
