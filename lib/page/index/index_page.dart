/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-18 13:38:27
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-18 14:23:19
 * @FilePath: /flutter_clone_github/lib/page/home/home_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:flutter_clone_github/page/home/home_page.dart';
import 'package:flutter_clone_github/page/trend/trend_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late PageController pageController;
  int _currentPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: _currentPage);
    super.initState();
  }
  /// 页面切换时
  void onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  /// 跳转页面
  void bottomOnTap(int page) {
    pageController.jumpToPage(page);
  }
  BottomNavigationBarItem _buildNavBottomBarItem(icon, label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        children: const [HomePage(), TrendPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [_buildNavBottomBarItem(GlobalIcons.HOME, '首页'), _buildNavBottomBarItem(GlobalIcons.MORE, '更多')],
        currentIndex: _currentPage,
        onTap: bottomOnTap,
      ),
    );
  }
}
