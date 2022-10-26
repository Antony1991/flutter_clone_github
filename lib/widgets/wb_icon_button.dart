/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-26 09:49:09
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-26 12:17:49
 * @FilePath: /flutter_clone_github/lib/widgets/wb_icon_button.dart
 * @Description: 自定义iconButton
 */
import 'package:flutter/material.dart';

class WBIconButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String iconName;
  final void Function()? onPressed;

  const WBIconButton(
      {Key? key,
      required this.iconName,
      required this.onPressed,
      this.width = 25.0,
      this.height = 25.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: key,
      onPressed: onPressed,
      icon: Image.asset(iconName, width: width, height: height),
    );
  }
}
