import 'package:flutter/material.dart';
import 'list_item.dart';

class ListItemCell extends StatelessWidget {
  ListItemCell({
    super.key,
    GestureTapCallback? onPressed,
    required this.item,
  }) : onPressed = onPressed ?? (() {});
  final ListItem item;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final icon = item.icon;
    return Material(
      // Makes integration tests possible.
      key: ValueKey(item.description),
      color: Theme.of(context).colorScheme.surface,
      child: MergeSemantics(
        child: InkWell(
          onTap: () {
            onPressed();
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 32,
              top: 20,
              end: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon,
                const SizedBox(width: 40),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: textTheme.titleMedium!
                            .apply(color: colorScheme.onSurface),
                      ),
                      Text(
                        item.description,
                        style: textTheme.labelSmall!.apply(
                          color: colorScheme.onSurface.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Divider(
                        thickness: 1,
                        height: 0.5,
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
