/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-28 20:24:38
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-28 22:16:24
 * @FilePath: /flutter_clone_github/lib/page/home/wb_detail_page/wb_detail_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:flutter/material.dart';
import 'package:flutter_clone_github/model/WbInfo.dart';
import 'package:flutter_clone_github/widgets/wb_appbar.dart';

class WbDetailPage extends StatefulWidget {
  const WbDetailPage({Key? key}) : super(key: key);

  @override
  State<WbDetailPage> createState() => _WbDetailPageState();
}

class _WbDetailPageState extends State<WbDetailPage> {
  @override
  Widget build(BuildContext context) {
    final WbInfo data = ModalRoute.of(context)!.settings.arguments as WbInfo;
    print('data$data');
    return Scaffold(
      appBar: WbAppbar(title: '微博正文'),
      body: Container(
        child: Text('data'),
      ),
    );
  }
}
