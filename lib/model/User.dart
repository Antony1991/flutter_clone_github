/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-19 12:06:30
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-24 21:47:16
 * @FilePath: /flutter_clone_github/lib/model/user.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:json_annotation/json_annotation.dart';

/// 指定此类的代码生成文件(格式：part '类名.g.dart';)
part 'User.g.dart';

/// 添加序列化标注
@JsonSerializable()
class User {
  String? id;
  String? nick;
  String? headurl;
  String? decs;
  String? gender;
  String? followCount;
  String? fanCount;
  int? ismember;
  int? isvertify;

  User(this.id, this.nick, this.headurl, this.decs, this.gender,
      this.followCount, this.fanCount, this.ismember, this.isvertify);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// 命名构造函数
  User.empty();
}
