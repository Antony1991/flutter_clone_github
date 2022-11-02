/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-28 21:15:25
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-02 20:27:26
 * @FilePath: /flutter_clone_github/lib/widgets/wb_appbar.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:flutter_clone_github/common/style/styles.dart';
import 'package:flutter_clone_github/widgets/wb_icon_button.dart';

class WbAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  const WbAppbar({Key? key, required this.title, this.leading, this.actions})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: GlobalColors.white,
      leading: leading ?? BackButton(color: GlobalColors.primaryGreyValue),
      title:
          Text(title, style: TextStyle(color: GlobalColors.primaryDarkValue)),
      actions: actions ??
          [WBIconButton(iconName: GlobalIcons.ICON_MORE, onPressed: () {})],
    );
  }
}
