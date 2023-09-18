import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'yf_typedefs.dart';

/// 对话框
///
/// 使用方法：
/// YFDialog.of(context).showTextInputDialog(title: '修改昵称',
///  placeholder: '输入您喜欢的昵称',
///  onConfirm: (nickname) {
///     _saveNickname2Local(nickname);
///  })
class YFDialog {
  final TextEditingController _txtEditController = TextEditingController();
  late final BuildContext _context;

  void showTextInputDialog(
      {String title = '',
      String placeholder = '请输入内容',
      OnTextChangedCallback? onConfirm}) {
    _resetText();
    showDialog(
        context: _context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Card(
              color: Colors.transparent,
              elevation: 0.0,
              child: Column(
                children: [
                  TextField(
                    controller: _txtEditController,
                    decoration:
                        InputDecoration.collapsed(hintText: placeholder),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _dismissDialog(context);
                  _cancel();
                },
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () {
                  _dismissDialog(context);
                  if (_txtEditController.text.trim().isNotEmpty) {
                    if (onConfirm != null) {
                      onConfirm(text());
                    }
                  }
                },
                child: const Text('确定'),
              ),
            ],
          );
        });
  }

  String text() {
    return _txtEditController.text;
  }

  void _dismissDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void _cancel() {
    _resetText();
  }

  void _resetText() {
    _txtEditController.text = '';
  }

  static YFDialog of(BuildContext context) {
    YFDialog dialog = YFDialog();
    dialog._context = context;
    return dialog;
  }
}
