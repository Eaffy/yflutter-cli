import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// 将 go_router 用到的接口包装
/// 通过该类，将第三方插件的影响隔离
export 'yf_routes.dart';

class YFRouter {
  static Future<T?> push<T extends Object?>(
    BuildContext context,
    String routName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) =>
      context.pushNamed(routName,
          pathParameters: pathParameters, queryParameters: queryParameters);
}
