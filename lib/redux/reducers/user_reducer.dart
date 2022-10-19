/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-18 21:03:08
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-19 14:09:03
 * @FilePath: /flutter_clone_github/lib/redux/user_redux.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_clone_github/model/User.dart';
import 'package:flutter_clone_github/redux/actions/user_action.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<User?>([
  TypedReducer<User?, UserAction>(updateLoaded),
]);

User? updateLoaded(User? user, action) {
  user = action.userInfo;
  return user;
}
