/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-23 21:53:42
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-24 20:13:14
 * @FilePath: /flutter_clone_github/lib/common/service/result_data.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
/// 接口返回值
class ResultData {
  var data;
  String? msg;
  int? status;
  var headers;

  ResultData(this.data, this.msg, this.status, {this.headers});
}
