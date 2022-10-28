/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-28 19:37:28
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-28 20:10:16
 * @FilePath: /flutter_clone_github/lib/widgets/easyfresh/wb_easyfresh.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:async';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class WbEasyfresh extends StatefulWidget {
  final Widget child;
  final FutureOr<dynamic> Function()? onRefresh;
  final FutureOr<dynamic> Function()? onLoad;
  final EasyRefreshController? controller;

  const WbEasyfresh(
      {Key? key,
      this.controller,
      required this.child,
      required this.onLoad,
      required this.onRefresh})
      : super(key: key);

  @override
  State<WbEasyfresh> createState() => _WbEasyfreshState();
}

class _WbEasyfreshState extends State<WbEasyfresh> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        child: widget.child,
        header: ClassicHeader(
            dragText: '下拉刷新',
            armedText: '释放开始',
            processingText: '刷新中...',
            readyText: '刷新中...',
            processedText: '刷新成功',
            messageText: '最后更新于 %T'),
        footer: ClassicFooter(
            dragText: '上拉加载',
            processingText: '加载中...',
            readyText: '加载中...',
            processedText: '加载成功',
            messageText: '最后更新于 %T'),
        onLoad: widget.onLoad,
        onRefresh: widget.onRefresh,
        controller: widget.controller);
  }
}
