import 'package:shared_preferences/shared_preferences.dart';
import '../keys_consts.dart';

Future<void> getSharedPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String player1Name = prefs.getString(keyName) ?? '李雷';
}

void _save2Local() async {
  final prefs = await SharedPreferences.getInstance();
  final playerName1 = "";
  await prefs.setString(keyName, playerName1);
}
