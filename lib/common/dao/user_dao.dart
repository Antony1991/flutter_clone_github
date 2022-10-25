/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-24 19:00:40
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-25 12:16:17
 * @FilePath: /flutter_clone_github/lib/common/dao/user_dao.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_clone_github/common/config/config.dart';
import 'package:flutter_clone_github/common/dao/dao_result.dart';
import 'package:flutter_clone_github/common/local/local_storage.dart';
import 'package:flutter_clone_github/model/User.dart';
import 'package:flutter_clone_github/redux/actions/user_action.dart';
import 'package:flutter_clone_github/redux/app_state.dart';
import 'package:redux/redux.dart';

class UserDao {
  static login() async {}

  static initUserInfo(Store<GithubState> store) async {
    User? user = await LocalStorage.get(Config.userInfoKey);
    if (user?.id != null) {
      store.dispatch(UserAction(user));
    }
    return DataResult(user, user?.id != null);
  }
}
