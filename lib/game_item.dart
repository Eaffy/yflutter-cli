class GameItem {
  final String title;
  final String subtitle;
  final String imageName;
  final String route;

  GameItem(
      {required this.title,
      required this.imageName,
      this.route = '',
      this.subtitle = ''});
}
