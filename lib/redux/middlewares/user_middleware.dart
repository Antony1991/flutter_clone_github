/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-23 21:26:28
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-24 21:29:10
 * @FilePath: /flutter_clone_github/lib/redux/reducers/user/user_middleware.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:dio/dio.dart';
import 'package:flutter_clone_github/common/service/address.dart';
import 'package:flutter_clone_github/common/service/api.dart';
import 'package:flutter_clone_github/common/service/result_data.dart';
import 'package:flutter_clone_github/model/User.dart';
import 'package:flutter_clone_github/redux/actions/user_action.dart';
import 'package:flutter_clone_github/redux/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<GithubState>> createUserMiddleware(User user) {
  return [TypedMiddleware<GithubState, LoginAction>(_loginState(user))];
}

void Function(Store<GithubState> store, LoginAction action, NextDispatcher next)
    _loginState(User user) {
  return (store, action, next) async {
    next(action);
    print("#### middle");
    try {
      FormData params = FormData.fromMap(
          {'username': action.username, 'password': action.password});
      ResultData? res = await httpManager.netFetch(
        Address.login,
        params,
        null,
        Options(method: "POST", contentType: Headers.formUrlEncodedContentType),
      );

      if (res?.status == 200) {
        store.dispatch(UserAction(User.fromJson(res?.data)));
      } else {
        store.dispatch(UserAction(User.fromJson({})));
      }
    } catch (e) {
      print(e);
    }
  };
}
