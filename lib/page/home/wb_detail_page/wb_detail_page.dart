/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-28 20:24:38
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-29 22:37:18
 * @FilePath: /flutter_clone_github/lib/page/home/wb_detail_page/wb_detail_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/model/WbInfo.dart';
import 'package:flutter_clone_github/widgets/wb_appbar.dart';
import 'package:flutter_clone_github/widgets/weiboitem/wb_detail_top.dart';
import 'dart:math' as math;

class WbDetailPage extends StatefulWidget {
  const WbDetailPage({Key? key}) : super(key: key);

  @override
  State<WbDetailPage> createState() => _WbDetailPageState();
}

class _WbDetailPageState extends State<WbDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _tabIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  /// 点赞
  Widget _mForward() {
    return Text('222222323');
  }

  /// 转发
  Widget _mComment() {
    return Text('转发');
  }

  @override
  Widget build(BuildContext context) {
    final WbInfo data = ModalRoute.of(context)!.settings.arguments as WbInfo;
    print('data${data.categoryId}');
    return Scaffold(
      appBar: WbAppbar(title: '微博正文'),
      body: ExtendedNestedScrollView(
        onlyOneScrollInBody: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: WbDetailTop(wbItemInfo: data),
            ),
            // SliverPersistentHeader(
            //   pinned: true,
            //   floating: true,
            //   delegate: _SliverAppBarDelegate(
            //     minHeight: 51,
            //     maxHeight: 51,
            //     child: TabBar(
            //         isScrollable: true,
            //         indicatorColor: Color(0xffFF3700),
            //         indicator: UnderlineTabIndicator(
            //             borderSide:
            //                 BorderSide(color: Color(0xffFF3700), width: 2),
            //             insets:
            //                 EdgeInsets.only(left: 10, right: 10, bottom: 7)),
            //         labelColor: Color(0xff333333),
            //         unselectedLabelColor: Color(0xff666666),
            //         labelStyle:
            //             TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
            //         unselectedLabelStyle: TextStyle(fontSize: 14.0),
            //         indicatorSize: TabBarIndicatorSize.label,
            //         controller: _controller,
            //         tabs: [
            //           new Tab(
            //             text: '转发' + data.zhuanfaNum.toString(),
            //           ),
            //           new Tab(
            //             text: '评论' + data.commentNum.toString(),
            //           ),
            //         ]),
            //   ),
            // )
          ];
        },
        body: IndexedStack(
          index: _tabIndex,
          children: [
            ExtendedVisibilityDetector(
                uniqueKey: Key('tab1'), child: _mForward()),
            ExtendedVisibilityDetector(
                child: _mComment(), uniqueKey: Key('tab2'))
          ],
        ),
      ),
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
