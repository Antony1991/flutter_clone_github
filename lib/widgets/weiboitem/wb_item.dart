/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-27 21:28:29
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-27 23:40:40
 * @FilePath: /flutter_clone_github/lib/widgets/weiboitem/wb_item.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:flutter_clone_github/common/style/styles.dart';
import 'package:flutter_clone_github/model/WbInfo.dart';
import 'package:flutter_clone_github/widgets/weiboitem/wb_avatar.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';

class WbItem extends StatelessWidget {
  final WbInfo wbItemInfo;
  final bool isDetail;
  const WbItem({Key? key, required this.wbItemInfo, required this.isDetail})
      : super(key: key);

  /// 渲染头部用户信息
  Widget _authorRow() {
    return ListTile(
        leading: WbAvatar(wbInfo: wbItemInfo),
        title: Row(
          children: [
            Text(
              wbItemInfo.userInfo.nick,
              style: TextStyle(
                  fontSize: 15,
                  color: wbItemInfo.userInfo.ismember == 0
                      ? GlobalColors.primaryDarkValue
                      : GlobalColors.textOrange),
            ),
            wbItemInfo.userInfo.ismember == 0
                ? SizedBox()
                : Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Image.asset(GlobalIcons.HOME_MEMBER,
                        width: 15, height: 13),
                  )
          ],
        ),
        subtitle: wbItemInfo.tail.isEmpty
            ? Text(wbItemInfo.userInfo.decs, style: TextStyle(fontSize: 11))
            : Row(
                children: [
                  Text(
                      formatDate(
                          DateTime.fromMillisecondsSinceEpoch(
                              wbItemInfo.createtime),
                          [mm, '-', dd]),
                      style: TextStyle(fontSize: 11)),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        '来自',
                        style: TextStyle(fontSize: 11),
                      )),
                  Text(wbItemInfo.tail, style: TextStyle(fontSize: 11))
                ],
              ),
        trailing: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: GlobalColors.white,
                border: Border.all(color: GlobalColors.textOrange),
                borderRadius: BorderRadius.circular(12)),
            child: Text('+ 关注',
                style: TextStyle(color: GlobalColors.textOrange, fontSize: 12)),
          ),
        ));
  }

  /// 渲染微博文本区域
  Widget _textContent() {
    var textContent = wbItemInfo.content.length > 150
        ? wbItemInfo.content.substring(0, 148) + ' ... ' + '全文'
        : wbItemInfo.content;
    var mTextContent = textContent.replaceAll("\\n", '\n');
    return Container(
      alignment: FractionalOffset.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ParsedText(
          text: mTextContent,
          style: TextStyle(
              height: 1.5, fontSize: 15, color: GlobalColors.primaryDarkValue),
          parse: <MatchText>[
            MatchText(
              pattern: r"\[(@[^:]+):([^\]]+)\]",
              style: TextStyle(color: Color(0xff5b778d)),
              renderText: ({String str = '', String pattern = ''}) {
                Map<String, String> map = Map<String, String>();
                RegExp customRegExp = RegExp(pattern);
                RegExpMatch match = customRegExp.firstMatch(str)!;
                print('match###${match.group(2)}');
                map['value'] = match.group(1)!;
                map['display'] = match.group(2)!;
                return map;
              },
              onTap: (p0) {},
            ),
            MatchText(
              pattern: '#.*?#',
              style: TextStyle(color: Color(0xff5b778d)),
              renderText: ({String pattern = '', String str = ''}) {
                Map<String, String> map = Map<String, String>();
                String idStr =
                    str.substring(str.indexOf(':') + 1, str.lastIndexOf('#'));
                String showStr = str
                    .substring(str.indexOf('#'), str.lastIndexOf('#') + 1)
                    .replaceAll(":" + idStr, "");
                map['display'] = showStr;
                map['value'] = idStr;
                return map;
              },
              onTap: (p0) {},
            ),
            MatchText(
              pattern: '(\\[/).*?(\\])',
              renderText: ({String pattern = '', String str = ''}) {
                Map<String, String> map = Map<String, String>();
                String mEmoji2 = '';
                try {
                  String mEmoji =
                      str.replaceAll(RegExp('(\\[/)|(\\])'), "") ?? "";
                  int mEmojiNew = int.parse(mEmoji);
                  mEmoji2 = String.fromCharCode(mEmojiNew);
                } on Exception {
                  mEmoji2 = "";
                }
                map["display"] = mEmoji2;
                return map;
              },
              onTap: (p0) {},
            ),
            MatchText(
              pattern: '全文',
              style: TextStyle(color: Color(0xff5b778d)),
              renderText: ({String pattern = '', String str = ''}) {
                Map<String, String> map = Map<String, String>();
                map["display"] = '全文';
                map['value'] = '全文';
                return map;
              },
              onTap: (p0) {},
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalColors.white,
      child: Column(
        children: [_authorRow(), _textContent()],
      ),
    );
  }
}
