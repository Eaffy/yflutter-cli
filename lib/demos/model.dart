/// 用 Map 取代 Model：
///
/// - 通过声明 Map 的 Key取代 Model 的属性，
/// - 无需声明任何构造函数，初始化即为创建一个 Map，Key 的数量随意
/// - Key 如赋值为后台返回数据的key，可以避免硬编码
/// - 缺点：无法直接创建默认值，必须兼容处理
class ModelKey {
  static const String userId = 'userId';
  static const String avatar = 'avatar';
  static const String nickname = 'nickname';
}
