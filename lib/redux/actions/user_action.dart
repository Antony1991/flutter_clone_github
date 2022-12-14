/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-19 13:14:19
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-24 20:24:21
 * @FilePath: /flutter_clone_github/lib/redux/actions/user_action.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_clone_github/model/User.dart';

class LoginSuccessAction {
  final String? code;
  LoginSuccessAction(this.code);
}

class LoginedAction {
  final bool isLogin;
  LoginedAction(this.isLogin);
}

class LoginAction {
  final String? username;
  final String? password;
  LoginAction({this.username, this.password});
}

class UserAction {
  User? user;
  UserAction(this.user);
}
