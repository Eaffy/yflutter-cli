import 'package:flutter/material.dart';
import 'list_item_cell.dart';
import 'list_item.dart';
// import 'package:launch_review/launch_review.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<ListItem> settings = [
      const ListItem(
          title: '意见反馈', description: '给我们提出宝贵意见', icon: Icon(Icons.feedback)),
      const ListItem(
          title: '给我们评分',
          description: '去 App Store 评分',
          icon: Icon(Icons.password_rounded)),
    ];
    return Scaffold(
        appBar: _buildAppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(children: [
              ListItemCell(
                item: settings[0],
                onPressed: () {
                  // LaunchReview.launch();
                },
              ),
              ListItemCell(
                item: settings[1],
              ),
            ]),
          ),
        ));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('设置'),
    );
  }
}
