/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-02 21:02:43
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-02 21:12:38
 * @FilePath: /flutter_clone_github/lib/common/util/toast_util.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static show(String msgStr) {
    Fluttertoast.showToast(
      msg: msgStr,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      // backgroundColor:
    );
  }
}
