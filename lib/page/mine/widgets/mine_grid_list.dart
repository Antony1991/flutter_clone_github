/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-26 20:48:40
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-26 23:21:43
 * @FilePath: /flutter_clone_github/lib/page/mine/widgets/mine_grid_list.dart
 * @Description: 我的画册，我的故事 grid
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:flutter_clone_github/common/style/styles.dart';

class MineGridList extends StatefulWidget {
  const MineGridList({Key? key}) : super(key: key);

  @override
  State<MineGridList> createState() => _MineGridListState();
}

class _MineGridListState extends State<MineGridList> {
  List<MineGridListModel> items = [
    MineGridListModel(label: '我的相册', imgUrl: GlobalIcons.MINE_PIC),
    MineGridListModel(label: '我的故事', imgUrl: GlobalIcons.MINE_STORY),
    MineGridListModel(label: '我的赞', imgUrl: GlobalIcons.MINE_ZAN),
    MineGridListModel(label: '我的粉丝', imgUrl: GlobalIcons.MINE_FANS),
    MineGridListModel(label: '微博钱包', imgUrl: GlobalIcons.MINE_WALLET),
    MineGridListModel(label: '微博优选', imgUrl: GlobalIcons.MINE_GCHOOSE),
    MineGridListModel(label: '粉丝头条', imgUrl: GlobalIcons.MINE_FANNEWS),
    MineGridListModel(label: '客服中心', imgUrl: GlobalIcons.MINE_CUSTOMSER),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(((context, index) {
        return InkWell(
            focusColor: GlobalColors.primaryDarkValue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  items.elementAt(index).imgUrl,
                  width: 30,
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(items.elementAt(index).label),
                )
              ],
            ),
            onTap: () {});
      }), childCount: items.length),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
    );
  }
}

class MineGridListModel {
  final String imgUrl;
  final String label;
  MineGridListModel({this.imgUrl = '', this.label = ''});
}
