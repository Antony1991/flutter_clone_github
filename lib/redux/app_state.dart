/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-18 17:53:23
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-24 10:21:29
 * @FilePath: /flutter_clone_github/lib/redux/state.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_clone_github/model/User.dart';

class GithubState {
  /// 用户信息
  User? userInfo;

  /// 是否变灰色
  bool grey;

  /// 是否登录
  bool? login;

  // 构造函数
  GithubState({this.userInfo, this.grey = false, this.login});
}
