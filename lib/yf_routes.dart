import 'package:go_router/go_router.dart';
import 'yf_route_names.dart';
import 'home.dart';
import 'settings.dart';

final yfRouter = GoRouter(
  routes: [
    _goRoute(
      name: routeHome,
      builder: (context, state) => const HomeScreen(),
    ),
    _goRoute(
      name: routeSettings,
      builder: (context, state) => const SettingsScreen(),
    ),
    // _goRoute(
    //   name: routeSettings,
    //   builder: (context, state) => Screen(
    //       user1Name: state.uri.queryParameters[paramUser1Name]!,
    //       user2Name: state.uri.queryParameters[paramUser2Name]!),
    // ),
  ],
);

/// 因为 name 和 path 一致，包装一层，省了写同样的东西
GoRoute _goRoute({required String name, GoRouterWidgetBuilder? builder}) {
  return GoRoute(
    name: name,
    path: name,
    builder: builder,
  );
}
