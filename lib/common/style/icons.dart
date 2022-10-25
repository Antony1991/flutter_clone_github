/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-22 11:01:21
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-25 23:01:20
 * @FilePath: /flutter_clone_github/lib/common/style/icons.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

class GlobalIcons {
  static const String FONT_FAMILY = 'wxcIconFont';

  static const String DEFAULT_USER_ICON = 'static/images/logo.png';
  static const String DEFAULT_IMAGE = 'static/images/default_img.png';
  static const String DEFAULT_REMOTE_PIC =
      'http://img.cdn.goushuyu.cn/gsy_github_app_logo.png';

  static const IconData HOME =
      IconData(0xe624, fontFamily: GlobalIcons.FONT_FAMILY);
  static const IconData MORE =
      IconData(0xe674, fontFamily: GlobalIcons.FONT_FAMILY);
  static const IconData SEARCH =
      IconData(0xe61c, fontFamily: GlobalIcons.FONT_FAMILY);

  static const IconData LOGIN_USER =
      IconData(0xe666, fontFamily: GlobalIcons.FONT_FAMILY);
  static const IconData LOGIN_PW =
      IconData(0xe60e, fontFamily: GlobalIcons.FONT_FAMILY);

  static const String IC_MAIN_ADD = 'static/images/ic_main_add.png';
}

class TabbarIcons {
  static const String tabbarHome = 'static/images/tabbar_home.png';
  static const String tabbarHomeActive =
      'static/images/tabbar_home_highlighted.png';

  static const String tabbarVideo = 'static/images/tabbar_video.png';
  static const String tabbarVideoActive =
      'static/images/tabbar_video_highlighted.png';

  static const String tabbarDiscover = 'static/images/tabbar_discover.png';
  static const String tabbarDiscoverActive =
      'static/images/tabbar_discover_highlighted.png';

  static const String tabbarMessage = 'static/images/tabbar_message_center.png';
  static const String tabbarMessageActive =
      'static/images/tabbar_message_center_highlighted.png';

  static const String tabbarProfile = 'static/images/tabbar_profile.png';
  static const String tabbarProfileActive =
      'static/images/tabbar_profile_highlighted.png';
}
