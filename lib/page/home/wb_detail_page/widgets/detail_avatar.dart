/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-27 21:59:23
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-07 12:40:21
 * @FilePath: /flutter_clone_github/lib/widgets/weiboitem/wb_avatar.dart
 * @Description: 用户图片
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';

class DetailAvatar extends StatelessWidget {
  final String imgUrl;
  final double? width;
  final double? height;
  final int isvertify;
  const DetailAvatar(this.imgUrl,
      {Key? key,
      this.width = 35,
      this.height = 35,
      isVip,
      required this.isvertify})
      : super(key: key);

  Widget _buildAvatar() {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: const AssetImage(GlobalIcons.DEFAULT_IMAGE),
          image: NetworkImage(imgUrl),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isvertify == 0) {
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
