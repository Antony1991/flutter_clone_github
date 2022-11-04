/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-28 20:24:38
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-03 22:39:15
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
import 'dart:math' as math;

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
  // Widget _mForward(WbInfo wbItemInfo, BuildContext context) {
  //   List<WbForward> wbForwardList = context.watch<HomeProvider>().wbForwardList;
  //   return EasyRefresh(
  //       refreshOnStart: true,
  //       child: ListView.builder(
  //           itemBuilder: ((context, index) {
  //             WbForward wbForward = wbForwardList[index];
  //             return ListTile(
  //               leading: WbAvatar(wbInfo: wbItemInfo),
  //               title: Text(wbForward.fromuname,
  //                   style: TextStyle(
  //                       color: Color(0xff636363),
  //                       fontWeight: FontWeight.normal,
  //                       fontSize: 12)),
  //               subtitle: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(wbForward.content,
  //                       style: TextStyle(color: GlobalColors.primaryDarkValue)),
  //                   Text(
  //                       formatDate(
  //                           DateTime.fromMillisecondsSinceEpoch(
  //                               wbItemInfo.createtime),
  //                           [mm, '-', dd]),
  //                       style: TextStyle(fontSize: 11))
  //                 ],
  //               ),
  //             );
  //           }),
  //           itemCount: wbForwardList.length),
  //       // onRefresh: () {
  //       //   FormData formData = FormData.fromMap(
  //       //       {"pageNum": 1, "pageSize": 10, "weiboid": wbItemInfo.weiboId});
  //       //   Provider.of<HomeProvider>(context, listen: false)
  //       //       .getWbForwardList(formData);
  //       // },
  //       onLoad: () {
  //         ToastUtil.show("#####load");
  //       });
  // }

  /// 转发
  Widget _mComment() {
    return Text('转发');
  }

  Widget _buildBody(WbInfo itemInfo) {
    return EasyRefresh.builder(
        onRefresh: () async {
          await initForwardData();
        },
        onLoad: () {},
        refreshOnStart: true,
        header: EasyRefreshUtil.header,
        footer: EasyRefreshUtil.footer,
        childBuilder: ((context, physics) {
          return ScrollConfiguration(
              behavior: ERScrollBehavior(),
              child: ExtendedNestedScrollView(
                physics: physics,
                onlyOneScrollInBody: true,
                pinnedHeaderSliverHeightBuilder: () {
                  return 500;
                },
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    // SliverToBoxAdapter(
                    //   child: EasyRefresh(
                    //     onRefresh: () {},
                    //     child: WbDetailTop(wbItemInfo: itemInfo),
                    //   ),
                    // ),
                    // SliverPersistentHeader(
                    //   pinned: true,
                    //   floating: true,
                    //   delegate: _SliverAppBarDelegate(
                    //     minHeight: 51,
                    //     maxHeight: 51,
                    //     child: _buildTabbar(itemInfo),
                    //   ),
                    // )
                  ];
                },
                body: Column(children: [
                  WbDetailTop(wbItemInfo: itemInfo),
                  _buildTabbar(itemInfo),
                  Expanded(
                      flex: 1,
                      child: TabBarView(controller: _controller, children: [
                        ExtendedVisibilityDetector(
                            child: _AutomaticKeepAlive(
                                child: ListView.builder(
                                    physics: physics,
                                    itemBuilder: (context, index) {
                                      List<WbForward> wbForwardList = context
                                          .watch<HomeProvider>()
                                          .wbForwardList;
                                      return _mForward(
                                          wbForwardList.elementAt(index));
                                    },
                                    itemCount: context
                                        .watch<HomeProvider>()
                                        .wbForwardList
                                        .length)),
                            uniqueKey: Key('fored')),
                        ExtendedVisibilityDetector(
                            child: _AutomaticKeepAlive(
                                child: ListView.builder(
                                    physics: physics,
                                    itemBuilder: (context, index) {
                                      List<WbForward> wbForwardList = context
                                          .watch<HomeProvider>()
                                          .wbForwardList;
                                      if (wbForwardList.length > 0) {
                                        return SizedBox();
                                      }
                                      return _mForward(
                                          wbForwardList.elementAt(index));
                                    },
                                    itemCount: context
                                        .watch<HomeProvider>()
                                        .wbForwardList
                                        .length)),
                            uniqueKey: Key('comment'))
                      ])),
                ]),
                // body: IndexedStack(
                //   index: _tabIndex,
                //   children: [
                //     ExtendedVisibilityDetector(
                //         uniqueKey: Key('tab1'),
                //         child: _mForward(itemInfo, context)),
                //     ExtendedVisibilityDetector(
                //         child: _mComment(), uniqueKey: Key('tab2'))
                //   ],
                // ),
              ));
        }));
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
    print('data${data.categoryId}');
    return Scaffold(
      appBar: WbAppbar(title: '微博正文'),
      // body: EasyRefresh(
      //     header: EasyRefreshUtil.header,
      //     footer: EasyRefreshUtil.footer,
      //     refreshOnStart: true,
      //     onRefresh: () {
      //       initForwardData();
      //     },
      //     onLoad: () {},
      // child: CustomScrollView(
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: EasyRefresh(child: WbDetailTop(wbItemInfo: data)),
      //     ),
      //     SliverToBoxAdapter(
      //       child: _buildTabbar(data),
      //     ),
      //     SliverToBoxAdapter(
      //         child: Column(children: [
      //       Expanded(
      //           child: TabBarView(controller: _controller, children: [
      //         ExtendedVisibilityDetector(
      //             child: _AutomaticKeepAlive(
      //                 child: ListView.builder(
      //                     itemBuilder: (context, index) {
      //                       List<WbForward> wbForwardList =
      //                           context.watch<HomeProvider>().wbForwardList;
      //                       return _mForward(
      //                           wbForwardList.elementAt(index));
      //                     },
      //                     itemCount: context
      //                         .watch<HomeProvider>()
      //                         .wbForwardList
      //                         .length)),
      //             uniqueKey: Key('fored')),
      //         ExtendedVisibilityDetector(
      //             child: _AutomaticKeepAlive(
      //                 child: ListView.builder(
      //                     itemBuilder: (context, index) {
      //                       List<WbForward> wbForwardList =
      //                           context.watch<HomeProvider>().wbForwardList;
      //                       if (wbForwardList.length > 0) {
      //                         return SizedBox();
      //                       }
      //                       return _mForward(
      //                           wbForwardList.elementAt(index));
      //                     },
      //                     itemCount: context
      //                         .watch<HomeProvider>()
      //                         .wbForwardList
      //                         .length)),
      //             uniqueKey: Key('comment'))
      //       ]))
      //     ])),
      //     // SliverList(delegate: SliverChildBuilderDelegate(((context, index) {
      //     // })))
      //   ],
      // ),
      // child: ExtendedNestedScrollView(
      //     floatHeaderSlivers: true,
      //     headerSliverBuilder: (context, innerBoxIsScrolled) {
      //       return [];
      //       // return [
      //       //   SliverToBoxAdapter(
      //       //     child: EasyRefresh(child: WbDetailTop(wbItemInfo: data)),
      //       //   ),
      //       // ];
      //     },
      //     body: ListView.builder(
      //       itemBuilder: ((context, index) {
      //         List<WbForward> wbForwardList =
      //             context.watch<HomeProvider>().wbForwardList;
      //         return _mForward(wbForwardList.elementAt(index));
      //       }),
      //       itemCount: context.watch<HomeProvider>().wbForwardList.length,
      //     )))
      body: _buildBody(data),
      // body: ExtendedNestedScrollView(
      //   onlyOneScrollInBody: true,
      //   pinnedHeaderSliverHeightBuilder: () {
      //     return MediaQuery.of(context).padding.top + kToolbarHeight + 100;
      //   },
      //   headerSliverBuilder: (context, innerBoxIsScrolled) {
      //     return [
      //       // SliverPadding(padding: EdgeInsets.only(top: ))
      //       SliverToBoxAdapter(
      //         child: WbDetailTop(wbItemInfo: data),
      //       ),
      //       SliverPersistentHeader(
      //         pinned: true,
      //         floating: true,
      //         delegate: _SliverAppBarDelegate(
      //           minHeight: 51,
      //           maxHeight: 51,
      //           child: _buildTabbar(data),
      //         ),
      //       )
      //     ];
      //   },
      //   body: IndexedStack(
      //     index: _tabIndex,
      //     children: [
      //       ExtendedVisibilityDetector(
      //           uniqueKey: Key('tab1'), child: _mForward(data, context)),
      //       ExtendedVisibilityDetector(
      //           child: _mComment(), uniqueKey: Key('tab2'))
      //     ],
      //   ),
      // ),
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
