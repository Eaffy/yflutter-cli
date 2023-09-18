import 'dart:convert';
import 'package:crypto/crypto.dart';

/// installing
///
/// `flutter pub add crypto`
String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
