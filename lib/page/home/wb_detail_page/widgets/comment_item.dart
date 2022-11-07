/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-07 10:39:18
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-07 17:50:13
 * @FilePath: /flutter_clone_github/lib/page/home/wb_detail_page/widgets/comment_item.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:flutter_clone_github/common/util/toast_util.dart';
import 'package:flutter_clone_github/model/WbComment.dart';
import 'package:flutter_clone_github/page/home/wb_detail_page/widgets/detail_avatar.dart';

class CommentItem extends StatelessWidget {
  final WbComment commentItem;
  const CommentItem(this.commentItem, {Key? key}) : super(key: key);

  /// 渲染名称和头衔
  Widget _buildName() {
    return Row(
      children: [
        Text(commentItem.fromuname,
            style: TextStyle(
                fontSize: 11,
                color: commentItem.fromuserismember == 0
                    ? Color(0xff636363)
                    : Color(0xfff86119))),
        commentItem.fromuserismember == 0
            ? SizedBox()
            : Container(
                margin: EdgeInsets.only(left: 5),
                child:
                    Image.asset(GlobalIcons.HOME_MEMBER, width: 15, height: 13),
              )
      ],
    );
  }

  ///渲染评论楼梯区域
  Widget _buildCommentReply() {
    if (commentItem.commentreplynum == 0) {
      return SizedBox();
    } else if (commentItem.commentreplynum == 1) {
      Container(
        padding: EdgeInsets.all(5),
        child: RichText(
          text: TextSpan(
              text: commentItem.commentreply[0].fromuname,
              style: TextStyle(fontSize: 12, color: Color(0xff45587e)),
              children: [
                TextSpan(
                    text: commentItem.commentreply[0].content,
                    style: TextStyle(fontSize: 12, color: Color(0xff333333))),
              ]),
        ),
      );
    } else if (commentItem.commentreplynum == 2) {
      return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: RichText(
                text: TextSpan(
                    text: commentItem.commentreply[0].fromuname + "：",
                    style: TextStyle(fontSize: 12, color: Color(0xff45587e)),
                    children: [
                      TextSpan(
                          text: commentItem.commentreply[0].content,
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff333333)))
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              child: RichText(
                text: TextSpan(
                    text: commentItem.commentreply[1].fromuname + "：",
                    style: TextStyle(fontSize: 12, color: Color(0xff45587e)),
                    children: [
                      TextSpan(
                          text: commentItem.commentreply[1].content,
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff333333)))
                    ]),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: RichText(
                text: TextSpan(
                    text: commentItem.commentreply[0].fromuname + "：",
                    style: TextStyle(fontSize: 12, color: Color(0xff45587e)),
                    children: [
                      TextSpan(
                          text: commentItem.commentreply[0].content,
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff333333)))
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              child: RichText(
                text: TextSpan(
                    text: commentItem.commentreply[1].fromuname + "：",
                    style: TextStyle(fontSize: 12, color: Color(0xff45587e)),
                    children: [
                      TextSpan(
                          text: commentItem.commentreply[1].content,
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff333333)))
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              child: Row(
                children: [
                  Text(
                    '共${commentItem.commentreplynum}条回复',
                    style: TextStyle(color: Color(0xff45587E), fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
    return SizedBox();
  }

  /// 渲染内容区域
  Widget _buildContent() {
    return InkWell(
      onTap: (() {
        ToastUtil.show('点击');
      }),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Text(commentItem.content,
                style: TextStyle(color: Color(0xff333333), fontSize: 13)),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xfff7f7f7),
                borderRadius: BorderRadius.all(Radius.circular(4))),
            margin: EdgeInsets.only(
                top: commentItem.commentreplynum == 0 ? 0 : 5, right: 15),
            child: _buildCommentReply(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 头像
          Container(
            margin: EdgeInsets.only(right: 10),
            child: DetailAvatar(commentItem.fromhead,
                isvertify: commentItem.fromuserisvertify),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildName(), _buildContent()],
          ))
        ],
      ),
    );
  }
}
