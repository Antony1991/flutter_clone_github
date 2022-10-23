import 'package:flutter_clone_github/common/config/ignoreConfig.dart';

class Address {
  static String getOAuthUrl() {
    return "https://github.com/login/oauth/authorize?client_id"
        "=${IgnoreConfig.CLIENT_ID}&state=app&"
        "scope=user,repo,gist,notifications,read:org,workflow&"
        "redirect_uri=gsygithubapp://authed";
  }
}
