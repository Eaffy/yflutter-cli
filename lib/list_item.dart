import 'package:flutter/cupertino.dart';

class ListItem {
  const ListItem({
    required this.title,
    required this.description,
    required this.icon,
  });
  final String title;
  final String description;
  final Icon icon;
}
