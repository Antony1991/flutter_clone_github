/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-18 15:46:52
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-19 15:13:56
 * @FilePath: /flutter_clone_github/lib/router/router.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/page/home/home_page.dart';
import 'package:flutter_clone_github/page/splash/splash_page.dart';

class Routers {
  static String home = '/home';
  static String splash = '/';
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      splash: (context) => const SplashPage(),
      home: (context) => const HomePage(),
    };
  }
}
