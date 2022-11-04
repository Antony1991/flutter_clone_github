/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-02 15:24:52
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-03 12:00:57
 * @FilePath: /flutter_clone_github/lib/page/video/video_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/model/WbInfo.dart';
import 'package:flutter_clone_github/provider/home_provider.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EasyRefresh(
        // refreshOnStart: true,
        // refreshOnStartHeader: BuilderHeader(
        //     builder: ((context, state) {
        //       print("########start");
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
        // // controller: easyRefreshController,
        // onRefresh: () async {
        //   FormData formData = FormData.fromMap({
        //     "catid": '0',
        //     "pageNum": 1,
        //     "pageSize": 10,
        //     "userId": context.read<UserProvider>().userInfo?.id
        //   });
        //   await Provider.of<HomeProvider>(context, listen: false)
        //       .getWeiBoList(formData);
        //   // easyRefreshController.finishLoad();
        //   // easyRefreshController.finishRefresh();
        // },
        onLoad: () async {
          // FormData formData = FormData.fromMap({
          //   "catid": widget.mCatId,
          //   "pageNum": 1,
          //   "pageSize": 10,
          //   "userId": context.read<UserProvider>().userInfo?.id
          // });
          // print("#################render");
          // await Provider.of<HomeProvider>(context, listen: false)
          //     .getWeiBoList(formData);
          // easyRefreshController.finishLoad();
          // easyRefreshController.finishRefresh();
        },
        child: ListView.builder(
          itemBuilder: ((context, index) {
            WbInfo wbInfo =
                context.watch<HomeProvider>().weiboList.elementAt(index);
            return InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, Routers.HomeWbDetail,
                  //     arguments: wbInfo);
                },
                child: Text('12-3-2-3-12-3-123-12-3'));
          }),
          itemCount: context.watch<HomeProvider>().weiboList.length,
        ),
      ),
    );
  }
}
