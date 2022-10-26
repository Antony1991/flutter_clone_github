/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-26 13:23:16
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-26 16:08:28
 * @FilePath: /flutter_clone_github/lib/widgets/user/user_avatar.dart
 * @Description: 用户头像widget
 */

import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:flutter_clone_github/model/User.dart';
import 'package:flutter_clone_github/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserAvatar extends StatefulWidget {
  const UserAvatar({super.key});

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

Widget _buildAvatar(User? user) {
  if (user == null || user.headurl == null) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: FadeInImage(
        fit: BoxFit.cover,
        placeholder: const AssetImage(GlobalIcons.DEFAULT_IMAGE),
        image: NetworkImage(user?.headurl ?? ''),
      ),
    );
  }
  return const CircleAvatar(
    radius: 25,
    backgroundImage: AssetImage(GlobalIcons.AVATAR_DEFAULT),
  );
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    User? userInfo = context.watch<UserProvider>().userInfo;
    if (userInfo?.isvertify == 0) {
      return _buildAvatar(userInfo);
    }
    return Stack(
      children: [
        _buildAvatar(userInfo),
        Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(GlobalIcons.HOME_VERTIFY, width: 16, height: 16))
      ],
    );
  }
}
