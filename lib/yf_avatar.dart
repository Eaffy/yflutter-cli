import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ios_platform_images/ios_platform_images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'demos/read_write_files_demo.dart';
import 'yf_typedefs.dart';

// TODO: 使用需要添加 NSPhotoLibraryUsageDescription 到 info.plist
class Avatar extends StatelessWidget {
  const Avatar(
      {super.key, required this.avatar, required this.onAvatarChanged});
  final File? avatar;
  final OnValueChangedCallback onAvatarChanged;

  @override
  Widget build(BuildContext context) {
    Image avatarImg;
    if (avatar != null) {
      avatarImg = Image.file(
        avatar!,
        width: 88,
        height: 88,
        fit: BoxFit.fill,
      );
    } else {
      avatarImg =
          Image(image: IosPlatformImages.load('avatar'), width: 88, height: 88);
    }
    return ClipRRect(
        borderRadius: BorderRadius.circular(44),
        child: GestureDetector(
          onTap: _pickImageFromGallery,
          child: avatarImg,
        ));
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    String imagePath = returnedImage.path;
    File newImage = File(imagePath);
    String imageName = generateMd5(DateTime.timestamp().toString());
    await writeImage(newImage, imageName);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyUserAvatar, imageName);
    onAvatarChanged(imageName);
  }
}
