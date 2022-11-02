/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-02 18:43:34
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-02 21:13:12
 * @FilePath: /flutter_clone_github/lib/page/home/wb_publish_page/wb_publish_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
/// 发布微博界面
import "package:flutter/material.dart";
import 'package:flutter_clone_github/common/style/styles.dart';
import 'package:flutter_clone_github/common/util/toast_util.dart';
import 'package:flutter_clone_github/widgets/wb_appbar.dart';

class WbPublishPage extends StatefulWidget {
  const WbPublishPage({super.key});

  @override
  State<WbPublishPage> createState() => _WbPublishPageState();
}

class _WbPublishPageState extends State<WbPublishPage> with WbPublishBLoC {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  /// 输入框内容
  Widget _buildTextField() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      constraints: BoxConstraints(minHeight: 50),
      child: TextField(
        controller: _textEditingController,
        maxLines: 5,
        style: TextStyle(color: GlobalColors.primaryDarkValue, fontSize: 15),
        decoration: InputDecoration.collapsed(
            hintText: '分享新鲜事',
            hintStyle: TextStyle(color: Color(0xff919191), fontSize: 15)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WbAppbar(
        title: '发微博',
        leading: TextButton(onPressed: () {}, child: Text('取消')),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  ToastUtil.show("######发送");
                },
                child: Container(
                  height: 30,
                  margin: EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: GlobalColors.textOrange),
                  child: Text('发送',
                      style:
                          TextStyle(fontSize: 12, color: GlobalColors.white)),
                ),
              )
            ],
          )
        ],
      ),
      body: ListView(
        children: [_buildTextField()],
      ),
    );
  }
}

mixin WbPublishBLoC on State<WbPublishPage> {}
