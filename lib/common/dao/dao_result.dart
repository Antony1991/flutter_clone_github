/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-25 12:12:29
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-25 12:13:24
 * @FilePath: /flutter_clone_github/lib/common/dao/dao_result.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
class DataResult {
  var data;
  late bool result;
  Function? next;

  DataResult(this.data, this.result, {this.next});
}
