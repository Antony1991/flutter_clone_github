/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-18 13:33:09
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-03 16:06:18
 * @FilePath: /flutter_clone_github/lib/router/navigator_utils.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

/// 路由导航
class NavigatorUtils {
  // 替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  // 跳转
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  /// 返回
  static pop(BuildContext context) {
    Navigator.pop(context);
  }

  // 通用page
  static Widget pageContainer(widget, BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: widget);
  }
}
