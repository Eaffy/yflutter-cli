import 'package:flutter/material.dart';

PreferredSizeWidget appBarWithOneTitle(String title) {
  return AppBar(title: Text(title));
}

PreferredSizeWidget appBarWithTitleAndIconButton(
    {String title = "", required Icon icon, void Function()? onPressed}) {
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(icon: icon, onPressed: onPressed),
    ],
  );
}
