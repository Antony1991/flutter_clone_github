/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-29 21:27:00
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-29 22:12:28
 * @FilePath: /flutter_clone_github/lib/widgets/weiboitem/wb_detail_top.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:flutter_clone_github/common/style/styles.dart';
import 'package:flutter_clone_github/model/WbInfo.dart';
import 'package:flutter_clone_github/widgets/weiboitem/wb_item.dart';

class WbDetailTop extends StatelessWidget {
  final WbInfo wbItemInfo;
  const WbDetailTop({Key? key, required this.wbItemInfo}) : super(key: key);

  /// 分享item
  Widget _shareRowItem(String img) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Image.asset(img, width: 30, height: 30),
      ),
    );
  }

  ///  分享
  Widget _shareRow() {
    return Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('分享'),
            _shareRowItem(GlobalIcons.SHARE_GP_WX),
            _shareRowItem(GlobalIcons.SHARE_GP_WX_FIREND),
            _shareRowItem(GlobalIcons.SHARE_GP_QQ),
            _shareRowItem(GlobalIcons.SHARE_GP_QQZONE),
            _shareRowItem(GlobalIcons.SHARE_GP_LONG),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    print("Wb##${wbItemInfo.commentNum}");
    return ColoredBox(
        color: GlobalColors.white,
        child: Column(
          children: [
            WbItem(wbItemInfo: wbItemInfo, isDetail: true),
            _shareRow()
          ],
        ));
  }
}
