/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 10:14:49
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-07 17:05:38
 * @FilePath: /flutter_clone_github/lib/page/home/wb_detail_page/widgets/forward_item.dart
 * @Description: 转发列表
 */

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/styles.dart';
import 'package:flutter_clone_github/model/WbForward.dart';
import 'package:flutter_clone_github/page/home/wb_detail_page/widgets/detail_avatar.dart';

class ForwardItem extends StatelessWidget {
  final WbForward forwardItem;
  const ForwardItem(this.forwardItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      leading: DetailAvatar(forwardItem.fromhead,
          isvertify: forwardItem.fromuserisvertify),
      title: Text(forwardItem.fromuname,
          style: TextStyle(
              color: Color(0xff636363),
              fontWeight: FontWeight.normal,
              fontSize: 12)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(forwardItem.content,
              style: TextStyle(color: GlobalColors.primaryDarkValue)),
          Text(
              formatDate(
                  DateTime.fromMillisecondsSinceEpoch(forwardItem.createtime),
                  [mm, '-', dd]),
              style: TextStyle(fontSize: 11)),
          SizedBox(height: 5),
          Divider(
            thickness: 0.5,
            height: 0.5,
          )
        ],
      ),
    ));
  }
}
