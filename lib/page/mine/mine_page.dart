/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-26 09:10:41
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-26 23:22:36
 * @FilePath: /flutter_clone_github/lib/page/mine/mine_page.dart
 * @Description: 我的界面
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:flutter_clone_github/common/style/styles.dart';
import 'package:flutter_clone_github/model/User.dart';
import 'package:flutter_clone_github/page/mine/widgets/mine_grid_list.dart';
import 'package:flutter_clone_github/page/mine/widgets/user_flower.dart';
import 'package:flutter_clone_github/provider/user_provider.dart';
import 'package:flutter_clone_github/widgets/user/user_avatar.dart';
import 'package:flutter_clone_github/widgets/wb_icon_button.dart';
import 'package:provider/provider.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  AppBar _buildBar() {
    return AppBar(
      backgroundColor: GlobalColors.white,
      centerTitle: true,
      leading: IconButton(
          onPressed: () {},
          icon: Image.asset(GlobalIcons.MINE_ADD_FRIEND,
              width: 25.0, height: 25.0)),
      title: const Text(
        '我的',
        style: TextStyle(color: GlobalColors.primaryDarkValue),
      ),
      actions: [
        WBIconButton(iconName: GlobalIcons.MINE_QRCODE_2, onPressed: () {}),
        WBIconButton(iconName: GlobalIcons.MINE_SETTING, onPressed: () {})
      ],
    );
  }

  /// 渲染用户信息部分
  Widget _buildMyInfo() {
    User? user = Provider.of<UserProvider>(context, listen: false).userInfo;
    return ListTile(
      leading: const UserAvatar(),
      title: _buildUserTitle(user),
      subtitle: Text(user?.decs ?? '-'),
      trailing: Image.asset(GlobalIcons.RIGHT_ARROW, width: 15, height: 30),
      onTap: () {},
    );
  }

  /// 渲染用户标题
  Widget _buildUserTitle(User? user) {
    return Row(
      children: [
        Text(
          user?.nick ?? '-',
          style: const TextStyle(fontSize: 15, color: GlobalColors.textOrange),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Image.asset(
            GlobalIcons.HOME_MEMBER,
            width: 15,
            height: 13,
          ),
        )
      ],
    );
  }

  /// 渲染cell
  Widget _buildCellList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(((context, index) {
      return Column(children: [
        const SizedBox(height: 50),
        Column(
          children: [
            ListTileTheme(
                selectedColor: GlobalColors.white,
                child: ListTile(
                  shape: BorderDirectional(
                      bottom:
                          BorderSide(color: Theme.of(context).dividerColor)),
                  leading: Image.asset(GlobalIcons.MINE_FREENET,
                      width: 25, height: 25),
                  title: const Text('免流量'),
                  trailing: Image.asset(GlobalIcons.RIGHT_ARROW,
                      width: 15, height: 15),
                  onTap: () {},
                )),
            ListTile(
              shape: BorderDirectional(
                  bottom: BorderSide(color: Theme.of(context).dividerColor)),
              leading:
                  Image.asset(GlobalIcons.MINE_SPORT, width: 25, height: 25),
              title: const Text('微博运动'),
              trailing:
                  Image.asset(GlobalIcons.RIGHT_ARROW, width: 15, height: 15),
              onTap: () {},
            ),
            ListTile(
              shape: BorderDirectional(
                  bottom: BorderSide(color: Theme.of(context).dividerColor)),
              leading:
                  Image.asset(GlobalIcons.MINE_DRAFT, width: 25, height: 25),
              title: const Text('草稿箱'),
              trailing:
                  Image.asset(GlobalIcons.RIGHT_ARROW, width: 15, height: 15),
              onTap: () {},
            ),
          ],
        )
      ]);
    }), childCount: 1));
  }

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
        appBar: _buildBar(),
        backgroundColor: GlobalColors.white,
        body: CustomScrollView(
          center: centerKey,
          slivers: [
            SliverList(
                key: centerKey,
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Column(
                    children: [
                      _buildMyInfo(),
                      const Divider(
                        thickness: 5,
                      ),
                      const UserFlower(),
                      const Divider(thickness: 5)
                    ],
                  );
                }, childCount: 1)),
            const MineGridList(),
            _buildCellList()
          ],
        ));
  }
}
