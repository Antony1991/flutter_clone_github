/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-18 16:38:47
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-29 22:42:01
 * @FilePath: /flutter_clone_github/lib/page/splash/splash_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/styles.dart';
import 'package:flutter_clone_github/provider/user_provider.dart';
import 'package:flutter_clone_github/router/navigator_utils.dart';
import 'package:flutter_clone_github/router/router.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String text = '';
  double fontSize = 76;

  bool hadInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        text = "Welcome";
        fontSize = 60;
      });
    });

    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      setState(() {
        text = "GithubApp";
        fontSize = 60;
      });
    });
    Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      // LocalStorage.remove(Config.userInfoKey);
      userProvider.initUserInfo().then((value) {
        if (value != null) {
          NavigatorUtils.pushNamed(context, Routers.home);
        } else {
          NavigatorUtils.pushNamed(context, Routers.login);
        }
      });
    });
  }

  /// 背景图片
  Widget _buildImage() {
    return Center(child: Image.asset('static/images/welcome.png'));
  }

  /// 标题
  Widget _buildTitle() {
    return Align(
      alignment: const Alignment(0, 0.3),
      child: Text(text,
          style: TextStyle(
              color: GlobalColors.primaryDarkValue, fontSize: fontSize)),
    );
  }

  /// riv资源
  Widget _buildRiv() {
    return const Align(
      alignment: Alignment(0, 0.9),
      child: SizedBox(
        width: 200,
        height: 200,
        child: RiveAnimation.asset('static/file/launch.riv'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: GlobalColors.white,
        child: Stack(
          children: [_buildImage(), _buildTitle(), _buildRiv()],
        ),
      ),
    );
  }
}
