/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-25 10:33:01
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-25 10:38:15
 * @FilePath: /flutter_clone_github/lib/common/local/local_storage.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
