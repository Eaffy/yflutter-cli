import 'package:flutter/material.dart';
import '../navigation_bar.dart';

class OneNavigationBarScreen extends StatelessWidget {
  const OneNavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithOneTitle('拥有一个 navigationBar 的页面'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: ListView.builder(
            key: const ValueKey('dd'),
            primary: false,
            itemBuilder: (context, index) => Text('$index'),
            itemCount: 2,
          ),
        ),
      ),
    );
  }
}
