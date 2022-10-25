/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-18 13:38:27
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-25 21:10:51
 * @FilePath: /flutter_clone_github/lib/page/home/home_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:flutter_clone_github/page/home/wb_follow_page.dart';
import 'package:flutter_clone_github/page/home/wb_hot_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with HomePageBLoC, SingleTickerProviderStateMixin {
  @override
  void initState() {
    tabController = TabController(length: tabValues.length, vsync: this);
    super.initState();
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 50,
          color: const Color(0xffF9F9F9),
          alignment: Alignment.center,
          child: TabBar(
            isScrollable: true,
            tabs: [Tab(text: tabValues[0]), Tab(text: tabValues[1])],
            controller: tabController,
            indicatorColor: const Color(0xffff3700),
            indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xffff3700), width: 2),
                insets: EdgeInsets.only(bottom: 7)),
            labelColor: const Color(0xff333333),
            unselectedLabelColor: const Color(0xff666666),
            labelStyle:
                const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            unselectedLabelStyle: const TextStyle(fontSize: 16.0),
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
              onPressed: () {},
              icon:
                  Image.asset(GlobalIcons.IC_MAIN_ADD, width: 40, height: 40)),
        )
      ],
    );
  }

  Widget _buildTabView() {
    return Expanded(
        child: TabBarView(
      controller: tabController,
      children: const [WbFollowPage(), WbHotPage()],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: DefaultTabController(
              length: tabValues.length,
              child: Column(
                children: [_buildHeader(), _buildTabView()],
              ))),
    );
  }
}

mixin HomePageBLoC on State<HomePage> {
  final List<String> tabValues = ['关注', '热门'];
  late TabController tabController;
}
