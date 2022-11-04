/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-18 13:38:27
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-03 10:24:33
 * @FilePath: /flutter_clone_github/lib/page/home/home_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:flutter_clone_github/page/home/wb_follow_page.dart';
import 'package:flutter_clone_github/page/home/wb_hot_page.dart';
import 'dart:math' as math;

import 'package:flutter_clone_github/router/navigator_utils.dart';
import 'package:flutter_clone_github/router/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<String> tabValues = ['关注', '热门'];
  late TabController tabController;
  int _tabIndex = 0;
  @override
  void initState() {
    tabController = TabController(length: tabValues.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 50,
          color: const Color(0xffF9F9F9),
          alignment: Alignment.center,
          child: TabBar(
            onTap: (value) {
              setState(() {
                _tabIndex = value;
              });
            },
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
              onPressed: () {
                NavigatorUtils.pushNamed(context, Routers.HomeWbPublish);
              },
              icon:
                  Image.asset(GlobalIcons.IC_MAIN_ADD, width: 40, height: 40)),
        )
      ],
    );
  }

  Widget _buildTabView() {
    // return Expanded(
    //     child: TabBarView(
    //   controller: tabController,
    //   children: const [WbFollowPage(), WbHotPage()],
    // ));
    // return Expanded(
    //     flex: 1,
    //     child: ExtendedNestedScrollView(
    //         onlyOneScrollInBody: true,
    //         headerSliverBuilder: ((context, innerBoxIsScrolled) => [
    //               SliverPersistentHeader(
    //                 pinned: true,
    //                 floating: true,
    //                 delegate: _SliverAppBarDelegate(
    //                     child: _buildHeader(), maxHeight: 50, minHeight: 50),
    //               )
    //             ]),
    //         body: IndexedStack(
    //           index: _tabIndex,
    //           children: [
    //             ExtendedVisibilityDetector(
    //                 uniqueKey: Key('tab1'), child: WbFollowPage()),
    //             ExtendedVisibilityDetector(
    //                 child: WbHotPage(), uniqueKey: Key('tab2'))
    //           ],
    //         )));
    return ExtendedNestedScrollView(
        onlyOneScrollInBody: true,
        headerSliverBuilder: ((context, innerBoxIsScrolled) => [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: _SliverAppBarDelegate(
                    child: _buildHeader(), maxHeight: 51, minHeight: 51),
              )
            ]),
        body: IndexedStack(
          index: _tabIndex,
          children: [
            ExtendedVisibilityDetector(
                uniqueKey: Key('tab1'), child: WbFollowPage()),
            ExtendedVisibilityDetector(
                child: WbHotPage(), uniqueKey: Key('tab2'))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     body: ExtendedNestedScrollView(
    //   physics: NeverScrollableScrollPhysics(),
    //   onlyOneScrollInBody: true,
    //   pinnedHeaderSliverHeightBuilder: () {
    //     return 500;
    //   },
    //   headerSliverBuilder: (context, innerBoxIsScrolled) => [
    //     SliverToBoxAdapter(
    //       child: SizedBox(height: 100),
    //     )
    //   ],
    //   body: Container(
    //     child: Column(
    //       children: [
    //         _buildHeader(),
    //         Expanded(
    //             flex: 1,
    //             child: IndexedStack(
    //               index: 0,
    //               children: [
    //                 ExtendedVisibilityDetector(
    //                   uniqueKey: Key('Tab0'),
    //                   child: WbFollowPage(),
    //                 ),
    //                 ExtendedVisibilityDetector(
    //                   uniqueKey: Key('Tab1'),
    //                   child: WbHotPage(),
    //                 )
    //               ],
    //             ))
    //       ],
    //     ),
    //   ),
    // ));
    // return Scaffold(
    //   body: SafeArea(
    //       child: DefaultTabController(
    //           length: tabValues.length,
    //           child: Column(
    //             children: [_buildHeader(), _buildTabView()],
    //           ))),
    // );
    return Scaffold(
      body: SafeArea(child: _buildTabView()),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
