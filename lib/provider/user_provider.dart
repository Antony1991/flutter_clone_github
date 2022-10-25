/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-25 13:53:24
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-25 17:44:50
 * @FilePath: /flutter_clone_github/lib/provider/user_provider.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/config/config.dart';
import 'package:flutter_clone_github/common/local/local_storage.dart';
import 'package:flutter_clone_github/common/service/address.dart';
import 'package:flutter_clone_github/common/service/api.dart';
import 'package:flutter_clone_github/common/service/result_data.dart';
import 'package:flutter_clone_github/model/User.dart';

class UserProvider with ChangeNotifier {
  User? userInfo = User.empty();
  bool get isLogin => userInfo?.id != null;

  /// 获取初始化用户信息
  Future initUserInfo() async {
    var user = await LocalStorage.get(Config.userInfoKey);
    if (user != null) {
      userInfo = User.fromJson(jsonDecode(user));
    }
    notifyListeners();
    return userInfo?.id;
  }

  /// 登录
  Future loginIn(String username, String password) async {
    FormData params =
        FormData.fromMap({'username': username, 'password': password});
    ResultData? res = await httpManager.netFetch(
      Address.login,
      params,
      null,
      Options(method: "POST", contentType: Headers.formUrlEncodedContentType),
    );
    if (res?.status == 200) {
      LocalStorage.save(Config.userInfoKey, jsonEncode(res?.data));
      initUserInfo();
    }
    notifyListeners();
  }
}
