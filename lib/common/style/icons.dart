import 'package:flutter/material.dart';

class GlobalIcons {
  static const String FONT_FAMILY = 'wxcIconFont';

  static const String DEFAULT_USER_ICON = 'static/images/logo.png';
  static const String DEFAULT_IMAGE = 'static/images/default_img.png';
  static const String DEFAULT_REMOTE_PIC = 'http://img.cdn.goushuyu.cn/gsy_github_app_logo.png';

  static const IconData HOME = IconData(0xe624, fontFamily: GlobalIcons.FONT_FAMILY);
  static const IconData MORE = IconData(0xe674, fontFamily: GlobalIcons.FONT_FAMILY);
  static const IconData SEARCH = IconData(0xe61c, fontFamily: GlobalIcons.FONT_FAMILY);

  static const IconData LOGIN_USER = IconData(0xe666, fontFamily: GlobalIcons.FONT_FAMILY);
  static const IconData LOGIN_PW = IconData(0xe60e, fontFamily: GlobalIcons.FONT_FAMILY);
}
