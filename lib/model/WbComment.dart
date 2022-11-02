/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-02 10:45:22
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-02 11:40:56
 * @FilePath: /flutter_clone_github/lib/model/WbComment.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:json_annotation/json_annotation.dart';

/// 指定此类的代码生成文件(格式：part '类名.g.dart';)
part 'WbComment.g.dart';

/// 添加序列化标注
@JsonSerializable()
class WbComment {
  String commentid;
  String weiboid;
  String fromuid;
  String fromuname;
  String fromhead;
  int fromuserismember;
  int fromuserisvertify;
  String content;
  int createtime;
  List<Commentreply> commentreply;
  int commentreplynum;

  WbComment(
      {required this.commentid,
      required this.weiboid,
      required this.fromuid,
      required this.fromuname,
      required this.fromhead,
      required this.fromuserismember,
      required this.fromuserisvertify,
      required this.content,
      required this.createtime,
      required this.commentreply,
      required this.commentreplynum});

  factory WbComment.fromJson(Map<String, dynamic> json) =>
      _$WbCommentFromJson(json);

  Map<String, dynamic> toJson() => _$WbCommentToJson(this);
}

@JsonSerializable()
class Commentreply {
  String? commentid;
  String crid;
  String fromuid;
  String fromuname;
  String fromhead;
  int fromuserismember;
  int fromuserisvertify;
  String content;
  int createtime;

  Commentreply(
      {this.commentid,
      required this.crid,
      required this.fromuid,
      required this.fromuname,
      required this.fromhead,
      required this.fromuserismember,
      required this.fromuserisvertify,
      required this.content,
      required this.createtime});

  factory Commentreply.fromJson(Map<String, dynamic> json) =>
      _$CommentreplyFromJson(json);

  Map<String, dynamic> toJson() => _$CommentreplyToJson(this);
}
