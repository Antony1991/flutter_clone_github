/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-27 19:25:53
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-27 19:26:38
 * @FilePath: /flutter_clone_github/lib/model/WbInfo.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:json_annotation/json_annotation.dart';

part 'WbInfo.g.dart';

@JsonSerializable()
class WbInfo {
  String weiboId;
  String categoryId;
  String content;
  WeiBoUserInfo userInfo;
  List<String> picurl;
  dynamic zfContent;
  dynamic zfNick;
  dynamic zfUserId;
  List<String> zfPicurl;
  dynamic zfWeiBoId;

  dynamic zfVedioUrl;
  bool containZf;

  String vediourl;
  String tail;
  int createtime;
  int zanStatus;

  int zhuanfaNum;
  int likeNum;
  int commentNum;

  WbInfo(
      {required this.weiboId,
      required this.categoryId,
      required this.content,
      required this.userInfo,
      required this.picurl,
      required this.zfContent,
      required this.zfNick,
      required this.zfUserId,
      required this.zfPicurl,
      required this.zfWeiBoId,
      required this.containZf,
      required this.vediourl,
      required this.zfVedioUrl,
      required this.tail,
      required this.createtime,
      required this.zanStatus,
      required this.zhuanfaNum,
      required this.likeNum,
      required this.commentNum});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory WbInfo.fromJson(Map<String, dynamic> json) => _$WbInfoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$WbInfoToJson(this);
}

@JsonSerializable()
class WeiBoUserInfo {
  int id;
  String nick;
  String headurl;
  String decs;
  int ismember;

  int isvertify;

  WeiBoUserInfo(
      {required this.id,
      required this.nick,
      required this.headurl,
      required this.decs,
      required this.ismember,
      required this.isvertify});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory WeiBoUserInfo.fromJson(Map<String, dynamic> json) =>
      _$WeiBoUserInfoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$WeiBoUserInfoToJson(this);
}
