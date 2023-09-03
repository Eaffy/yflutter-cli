import 'game_item.dart';
import 'package:flutter/material.dart';
import 'package:ios_platform_images/ios_platform_images.dart';

class GameItemCard extends StatelessWidget {
  GameItemCard({super.key, GestureTapCallback? onPressed, required this.item})
      : onPressed = onPressed ?? (() {});
  final GameItem item;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.deepOrange.shade200,
          ),
          height: 120,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(image: IosPlatformImages.load(item.imageName))
                ],
              ),
              Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
