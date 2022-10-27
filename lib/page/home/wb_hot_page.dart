/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-25 20:02:18
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-27 20:39:54
 * @FilePath: /flutter_clone_github/lib/page/home/wb_hot_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/styles.dart';
import 'package:flutter_clone_github/page/home/widgets/home_wb_list.dart';

class WbHotPage extends StatefulWidget {
  const WbHotPage({super.key});

  @override
  State<WbHotPage> createState() => _WbHotPageState();
}

class _WbHotPageState extends State<WbHotPage>
    with SingleTickerProviderStateMixin {
  final List<WbHotTabbarModel> tabValues = [
    WbHotTabbarModel(title: '推荐', cardId: '1'),
    WbHotTabbarModel(title: '附近', cardId: '2'),
    WbHotTabbarModel(title: '榜单', cardId: '3'),
    WbHotTabbarModel(title: '明星', cardId: '4'),
    WbHotTabbarModel(title: '搞笑', cardId: '5'),
    WbHotTabbarModel(title: '社会', cardId: '999999'),
    WbHotTabbarModel(title: '测试', cardId: '10'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabValues.length, vsync: this);
    super.initState();
  }

  /// 渲染tabbar
  Widget _buildTabbar() {
    return TabBar(
        isScrollable: true,
        indicatorColor: GlobalColors.white,
        labelColor: const Color(0xffFF3700),
        unselectedLabelColor: const Color(0xff666666),
        controller: _tabController,
        labelStyle:
            const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(fontSize: 16.0),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: tabValues
            .map((WbHotTabbarModel tab) => Tab(text: tab.title))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabValues.length,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(height: 1),
            _buildTabbar(),
            Expanded(
              child: IndexedStack(
                  index: 0,
                  children: tabValues
                      .map((WbHotTabbarModel tab) => HomeWbList(
                            mCatId: tab.cardId,
                            key: Key(tab.cardId),
                          ))
                      .toList()),
            )
          ],
        ));
  }
}

class WbHotTabbarModel {
  final String title;
  final String cardId;
  WbHotTabbarModel({required this.title, required this.cardId});
}
