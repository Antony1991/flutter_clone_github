/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-28 20:24:38
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-04 20:54:16
 * @FilePath: /flutter_clone_github/lib/page/home/wb_detail_page/wb_detail_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/styles.dart';
import 'package:flutter_clone_github/common/util/easy_refresh_util.dart';
import 'package:flutter_clone_github/model/WbForward.dart';
import 'package:flutter_clone_github/model/WbInfo.dart';
import 'package:flutter_clone_github/provider/home_provider.dart';
import 'package:flutter_clone_github/widgets/wb_appbar.dart';
import 'package:flutter_clone_github/widgets/weiboitem/wb_detail_top.dart';

import 'package:provider/provider.dart';

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

  Future initForwardData() async {
    final WbInfo data = ModalRoute.of(context)!.settings.arguments as WbInfo;
    FormData formData = FormData.fromMap(
        {"pageNum": 1, "pageSize": 10, "weiboid": data.weiboId});
    return Provider.of<HomeProvider>(context, listen: false)
        .getWbForwardList(formData);
  }

  /// 点赞
  Widget _mForward(WbForward wbForward) {
    return ListTile(
      // leading: WbAvatar(wbInfo: data),
      title: Text(wbForward.fromuname,
          style: TextStyle(
              color: Color(0xff636363),
              fontWeight: FontWeight.normal,
              fontSize: 12)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(wbForward.content,
              style: TextStyle(color: GlobalColors.primaryDarkValue)),
          Text(
              formatDate(
                  DateTime.fromMillisecondsSinceEpoch(wbForward.createtime),
                  [mm, '-', dd]),
              style: TextStyle(fontSize: 11))
        ],
      ),
    );
  }

  /// 转发
  Widget _mComment() {
    return Text('转发');
  }

  Widget _buildBody(WbInfo itemInfo) {
    return EasyRefresh.builder(
        header: EasyRefreshUtil.getHeader(IndicatorPosition.locator),
        footer: EasyRefreshUtil.footer,
        onRefresh: () async {
          await initForwardData();
        },
        childBuilder: ((context, physics) {
          return ScrollConfiguration(
              behavior: ERScrollBehavior(),
              child: ExtendedNestedScrollView(
                  physics: physics,
                  onlyOneScrollInBody: true,
                  pinnedHeaderSliverHeightBuilder: () {
                    return MediaQuery.of(context).padding.top + kToolbarHeight;
                  },
                  headerSliverBuilder: ((context, innerBoxIsScrolled) {
                    return [
                      HeaderLocator.sliver(clearExtent: false),
                      SliverToBoxAdapter(
                        child: WbDetailTop(wbItemInfo: itemInfo),
                      ),
                      SliverToBoxAdapter(
                        child: _buildTabbar(itemInfo),
                      )
                    ];
                  }),
                  body: Column(
                    children: [
                      Expanded(
                          child: TabBarView(controller: _controller, children: [
                        ExtendedVisibilityDetector(
                            child: _AutomaticKeepAlive(
                                child: CustomScrollView(
                              physics: physics,
                              slivers: [
                                SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        ((context, index) {
                                  WbForward wbForward = context
                                      .watch<HomeProvider>()
                                      .wbForwardList[index];
                                  return _buildItem(wbForward);
                                }),
                                        childCount: context
                                            .watch<HomeProvider>()
                                            .wbForwardList
                                            .length))
                              ],
                            )),
                            uniqueKey: Key('tab1')),
                        ExtendedVisibilityDetector(
                            child: CustomScrollView(
                              physics: physics,
                              slivers: [
                                SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                  return Text('data');
                                }, childCount: 20))
                              ],
                            ),
                            uniqueKey: Key('tab2'))
                      ]))
                    ],
                  )));
        }));
  }

  _buildItem(wbForward) {
    return ListTile(
      // leading: WbAvatar(wbInfo: wbItemInfo),
      title: Text(wbForward.fromuname,
          style: TextStyle(
              color: Color(0xff636363),
              fontWeight: FontWeight.normal,
              fontSize: 12)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(wbForward.content,
              style: TextStyle(color: GlobalColors.primaryDarkValue)),
          Text(
              formatDate(
                  DateTime.fromMillisecondsSinceEpoch(wbForward.createtime),
                  [mm, '-', dd]),
              style: TextStyle(fontSize: 11))
        ],
      ),
    );
  }

  /// 渲染tabbar
  _buildTabbar(WbInfo itemInfo) {
    return TabBar(
        isScrollable: true,
        indicatorColor: Color(0xffFF3700),
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Color(0xffFF3700), width: 2),
            insets: EdgeInsets.only(left: 10, right: 10, bottom: 7)),
        labelColor: Color(0xff333333),
        unselectedLabelColor: Color(0xff666666),
        labelStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(fontSize: 14.0),
        indicatorSize: TabBarIndicatorSize.label,
        controller: _controller,
        onTap: (int value) {
          setState(() {
            _tabIndex = value;
          });
        },
        tabs: [
          new Tab(
            text: '转发' + itemInfo.zhuanfaNum.toString(),
          ),
          new Tab(
            text: '评论' + itemInfo.commentNum.toString(),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final WbInfo data = ModalRoute.of(context)!.settings.arguments as WbInfo;
    return Scaffold(
      appBar: WbAppbar(title: '微博正文'),
      body: _buildBody(data),
    );
  }
}

class _AutomaticKeepAlive extends StatefulWidget {
  final Widget child;
  const _AutomaticKeepAlive({Key? key, required this.child}) : super(key: key);

  @override
  State<_AutomaticKeepAlive> createState() => _AutomaticKeepAliveState();
}

class _AutomaticKeepAliveState extends State<_AutomaticKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
