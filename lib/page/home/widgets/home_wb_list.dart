/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-27 11:13:18
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-28 22:11:28
 * @FilePath: /flutter_clone_github/lib/page/home/widgets/home_wb_list.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:dio/dio.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/model/WbInfo.dart';
import 'package:flutter_clone_github/provider/home_provider.dart';
import 'package:flutter_clone_github/provider/user_provider.dart';
import 'package:flutter_clone_github/router/router.dart';
import 'package:flutter_clone_github/widgets/easyfresh/wb_easyfresh.dart';
import 'package:flutter_clone_github/widgets/weiboitem/wb_item.dart';
import 'package:provider/provider.dart';

class HomeWbList extends StatefulWidget {
  final String mCatId;
  const HomeWbList({Key? key, required this.mCatId}) : super(key: key);

  @override
  State<HomeWbList> createState() => _HomeWbListState();
}

class _HomeWbListState extends State<HomeWbList> {
  late EasyRefreshController easyRefreshController;

  @override
  void initState() {
    easyRefreshController = EasyRefreshController(
        controlFinishLoad: true, controlFinishRefresh: true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WbEasyfresh(
      controller: easyRefreshController,
      onRefresh: () async {
        FormData formData = FormData.fromMap({
          "catid": widget.mCatId,
          "pageNum": 1,
          "pageSize": 10,
          "userId": context.read<UserProvider>().userInfo?.id
        });
        await Provider.of<HomeProvider>(context, listen: false)
            .getWeiBoList(formData);
        easyRefreshController.finishLoad();
        easyRefreshController.finishRefresh();
      },
      onLoad: () async {
        FormData formData = FormData.fromMap({
          "catid": widget.mCatId,
          "pageNum": 1,
          "pageSize": 10,
          "userId": context.read<UserProvider>().userInfo?.id
        });
        print("#################render");
        await Provider.of<HomeProvider>(context, listen: false)
            .getWeiBoList(formData);
        easyRefreshController.finishLoad();
        easyRefreshController.finishRefresh();
      },
      child: ListView.builder(
        itemBuilder: ((context, index) {
          WbInfo wbInfo =
              context.watch<HomeProvider>().weiboList.elementAt(index);
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routers.HomeWbDetail,
                  arguments: wbInfo);
            },
            child: WbItem(wbItemInfo: wbInfo, isDetail: false),
          );
        }),
        itemCount: context.watch<HomeProvider>().weiboList.length,
      ),
    );
  }
}
