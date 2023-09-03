import 'package:flutter/material.dart';
import 'game_item.dart';
import 'game_item_card.dart';
import 'yf_router.dart';
import 'yf_route_names.dart';
import 'keys_consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    List<GameItem> games = [
      GameItem(title: '项目一', imageName: 'guitar', route: routeSettings),
    ];
    final icon =
        _isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: ListView.builder(
            key: const ValueKey(keyName),
            primary: false,
            itemBuilder: (context, index) => GameItemCard(
                item: games[index],
                onPressed: () {
                  YFRouter.push(context, games[index].route, queryParameters: {
                    // paramUser1Name: '男男男男',
                    // paramUser2Name: '女女女女',
                    // paramIsDare: '$index'
                  });
                }),
            itemCount: games.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isPlaying = !_isPlaying;
          });
        },
        child: icon,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('首页'),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context).pushNamed(routeSettings);
          },
        ),
      ],
    );
  }
}
