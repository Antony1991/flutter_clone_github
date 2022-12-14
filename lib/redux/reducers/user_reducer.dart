/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-18 21:03:08
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-25 12:01:08
 * @FilePath: /flutter_clone_github/lib/redux/user_redux.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_clone_github/redux/actions/user_action.dart';
import 'package:flutter_clone_github/redux/app_state.dart';
import 'package:redux/redux.dart';

final userReducer = <GithubState Function(GithubState, dynamic)>[
  TypedReducer<GithubState, UserAction>(_updateUser),
  TypedReducer<GithubState, LoginedAction>(_updateLoginStatus),
];

GithubState _updateUser(GithubState state, UserAction action) {
  print('--------#####${action.user}');
  // state.login = true;
  state.userInfo = action.user;
  if (action.user?.id != null) {
    state.login = true;
  } else {
    state.login = false;
  }
  return state;
}

GithubState _updateLoginStatus(GithubState state, action) {
  state.login = action.isLogin;
  return state;
}
