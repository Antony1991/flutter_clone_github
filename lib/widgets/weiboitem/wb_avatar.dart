/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-27 21:59:23
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-27 22:08:50
 * @FilePath: /flutter_clone_github/lib/widgets/weiboitem/wb_avatar.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:flutter_clone_github/model/WbInfo.dart';

class WbAvatar extends StatelessWidget {
  final WbInfo wbInfo;
  const WbAvatar({Key? key, required this.wbInfo}) : super(key: key);

  Widget _buildAvatar() {
    return SizedBox(
      width: 40,
      height: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: const AssetImage(GlobalIcons.DEFAULT_IMAGE),
          image: NetworkImage(wbInfo.userInfo.headurl),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (wbInfo.userInfo.isvertify == 0) {
      return _buildAvatar();
    }
    return Stack(
      children: [
        _buildAvatar(),
        Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(GlobalIcons.HOME_VERTIFY, width: 15, height: 15))
      ],
    );
  }
}
