/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-23 21:26:28
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-25 12:34:05
 * @FilePath: /flutter_clone_github/lib/redux/reducers/user/user_middleware.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:dio/dio.dart';
import 'package:flutter_clone_github/common/config/config.dart';
import 'package:flutter_clone_github/common/local/local_storage.dart';
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

Future<bool> Function(
        Store<GithubState> store, LoginAction action, NextDispatcher next)
    _loginState(User user) {
  return (store, action, next) async {
    next(action);
    try {
      FormData params = FormData.fromMap(
          {'username': action.username, 'password': action.password});
      ResultData? res = await httpManager.netFetch(
        Address.login,
        params,
        null,
        Options(method: "POST", contentType: Headers.formUrlEncodedContentType),
      );
      print("#######status=====${res?.status}");
      if (res?.status == 200) {
        LocalStorage.save(Config.userInfoKey, res?.data);
        store.dispatch(UserAction(User.fromJson(res?.data))).then((value) {
          print('##value===$value');
        });
      } else {
        store.dispatch(UserAction(User.fromJson({})));
      }
      return res?.status == 200;
    } catch (e) {
      print(e);
      return false;
    }
  };
}
