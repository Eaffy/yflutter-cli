import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<String> localFile(String imageName) async {
  final path = await _localPath;
  return "$path/$imageName.png";
}

Future<File> writeImage(File image, String imageName) async {
  final newPath = await localFile(imageName);
  final File newImage = await image.copy(newPath);
  return newImage;
}

Future<File?> imageFrom(String imageName) async {
  final newPath = await localFile(imageName);
  bool isExist = await File(newPath).exists();
  if (isExist) {
    return File(newPath);
  }
  return null;
}
