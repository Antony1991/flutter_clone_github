/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-18 15:46:52
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-02 18:48:57
 * @FilePath: /flutter_clone_github/lib/router/router.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/page/home/wb_detail_page/wb_detail_page.dart';
import 'package:flutter_clone_github/page/home/wb_publish_page/wb_publish_page.dart';
import 'package:flutter_clone_github/page/index/index_page.dart';
import 'package:flutter_clone_github/page/login/login_page.dart';
import 'package:flutter_clone_github/page/splash/splash_page.dart';

class Routers {
  static String home = '/index';
  static String splash = '/';

  /// 登录
  static String login = '/login';

  /// 注册
  static String register = '/register';

  /// 微博详情
  static String HomeWbDetail = '/home/detail';

  /// 发布微博
  static String HomeWbPublish = '/home/publish';

  /// 所有路由集合
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      splash: (context) => const SplashPage(),
      home: (context) => const IndexPage(),
      login: (context) => const LoginPage(),
      HomeWbDetail: (context) {
        return WbDetailPage();
      },
      HomeWbPublish: (context) => WbPublishPage()
    };
  }
}
