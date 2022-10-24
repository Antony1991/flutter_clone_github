/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-23 19:40:45
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-24 18:51:59
 * @FilePath: /flutter_clone_github/lib/common/service/address.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_clone_github/common/config/config.dart';
import 'package:flutter_clone_github/common/config/ignoreConfig.dart';

class Address {
  static const login = '${Config.baseUrl}/manage/hrluser/login.do';
  static String getOAuthUrl() {
    return "https://github.com/login/oauth/authorize?client_id"
        "=${IgnoreConfig.CLIENT_ID}&state=app&"
        "scope=user,repo,gist,notifications,read:org,workflow&"
        "redirect_uri=gsygithubapp://authed";
  }
}
