/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-26 17:42:42
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-26 20:34:35
 * @FilePath: /flutter_clone_github/lib/page/mine/widgets/user_flower.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:flutter/material.dart';
import 'package:flutter_clone_github/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserFlower extends StatefulWidget {
  const UserFlower({super.key});

  @override
  State<UserFlower> createState() => _UserFlowerState();
}

class _UserFlowerState extends State<UserFlower> with UserFlowerBLoC {
  @override
  Widget build(BuildContext context) {
    var userInfo = (context.watch<UserProvider>().userInfo)!.toJson();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: tabs
            .map((UserFlowerModal tab) => Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(tab.value == 'wbCount' ? '15' : userInfo[tab.value]),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(tab.title),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

mixin UserFlowerBLoC on State<UserFlower> {
  List<UserFlowerModal> tabs = [
    UserFlowerModal(value: 'wbCount', title: '微博'),
    UserFlowerModal(value: 'followCount', title: '关注'),
    UserFlowerModal(value: 'followCount', title: '粉丝')
  ].toList();
}

class UserFlowerModal {
  final String value;
  final String title;
  UserFlowerModal({this.value = '', this.title = ''});
}
