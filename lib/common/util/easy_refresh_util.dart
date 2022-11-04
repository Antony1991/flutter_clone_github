/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-03 16:49:21
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-04 16:56:32
 * @FilePath: /flutter_clone_github/lib/common/util/easy_refresh_util.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:easy_refresh/easy_refresh.dart';

class EasyRefreshUtil {
  static const ClassicHeader header = ClassicHeader(
      dragText: '下拉刷新',
      armedText: '释放开始',
      processingText: '刷新中...',
      readyText: '刷新中...',
      processedText: '刷新成功',
      messageText: '最后更新于 %T');
  static ClassicHeader getHeader(IndicatorPosition position) {
    return ClassicHeader(
        position: position,
        dragText: '下拉刷新',
        armedText: '释放开始',
        processingText: '刷新中...',
        readyText: '刷新中...',
        processedText: '刷新成功',
        messageText: '最后更新于 %T');
  }

  static const ClassicFooter footer = ClassicFooter(
      dragText: '上拉加载',
      processingText: '加载中...',
      readyText: '加载中...',
      processedText: '加载成功',
      messageText: '最后更新于 %T');
}
