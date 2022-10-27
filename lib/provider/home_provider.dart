/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-27 14:51:15
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-27 21:03:41
 * @FilePath: /flutter_clone_github/lib/provider/home_provider.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/service/address.dart';
import 'package:flutter_clone_github/common/service/api.dart';
import 'package:flutter_clone_github/common/service/result_data.dart';
import 'package:flutter_clone_github/model/WbInfo.dart';

class HomeProvider extends ChangeNotifier {
  List<WbInfo> weiboList = [];

  /// 定义一个存储微博数据的列表
  Future getWeiBoList(FormData formData) async {
    ResultData? res = await httpManager.netFetch(
        Address.getWeiBo, formData, null, Options(method: 'post'));
    weiboList = [];
    print('status#############${res?.data}');
    if (res?.status == 200) {
      var json = res?.data;
      json['list'].forEach((item) {
        weiboList.add(WbInfo.fromJson(item));
      });
    }
    notifyListeners();
    return weiboList;
  }
}
