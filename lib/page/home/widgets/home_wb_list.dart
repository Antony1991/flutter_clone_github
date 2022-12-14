/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-27 11:13:18
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-03 18:04:50
 * @FilePath: /flutter_clone_github/lib/page/home/widgets/home_wb_list.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/util/easy_refresh_util.dart';
import 'package:flutter_clone_github/model/WbInfo.dart';
import 'package:flutter_clone_github/provider/home_provider.dart';
import 'package:flutter_clone_github/provider/user_provider.dart';
import 'package:flutter_clone_github/router/router.dart';
import 'package:flutter_clone_github/widgets/weiboitem/wb_item.dart';
import 'package:provider/provider.dart';

class HomeWbList extends StatefulWidget {
  final String mCatId;
  const HomeWbList({Key? key, required this.mCatId}) : super(key: key);

  @override
  State<HomeWbList> createState() => _HomeWbListState();
}

class _HomeWbListState extends State<HomeWbList> {
  int currentPage = 1;
  late EasyRefreshController easyRefreshController;

  @override
  void initState() {
    easyRefreshController = EasyRefreshController(
        controlFinishLoad: true, controlFinishRefresh: true);
    initData(true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    easyRefreshController.dispose();
    super.dispose();
  }

  Future initData(bool isRefresh) async {
    setState(() {
      if (isRefresh) {
        currentPage = 1;
      } else {
        currentPage++;
      }
    });
    Map<String, dynamic> formData = {
      "catid": widget.mCatId,
      "pageNum": currentPage,
      "pageSize": 10,
      "userId": context.read<UserProvider>().userInfo?.id
    };
    var data = await Provider.of<HomeProvider>(context, listen: false)
        .getWeiBoList(formData);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      // refreshOnStart: true,
      // refreshOnStartHeader: BuilderHeader(
      //     builder: ((context, state) {
      //       if (state.mode == IndicatorMode.inactive ||
      //           state.mode == IndicatorMode.done) {
      //         return SizedBox();
      //       }
      //       return Container(
      //         padding: EdgeInsets.only(bottom: 100),
      //         width: double.infinity,
      //         height: state.viewportDimension,
      //         alignment: Alignment.center,
      //         child: SpinKitFadingCube(
      //             size: 24, color: Theme.of(context).primaryColor),
      //       );
      //     }),
      //     triggerOffset: 70,
      //     clamping: true,
      //     processedDuration: Duration.zero,
      //     position: IndicatorPosition.above),
      header: EasyRefreshUtil.header,
      footer: EasyRefreshUtil.footer,
      controller: easyRefreshController,
      onRefresh: () async {
        if (mounted) {
          await initData(true);
          easyRefreshController.finishLoad();
          easyRefreshController.finishRefresh();
        }
      },
      onLoad: () async {
        await initData(false);
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
