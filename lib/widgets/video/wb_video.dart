/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-28 12:45:55
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-28 15:22:52
 * @FilePath: /flutter_clone_github/lib/widgets/video/wb_video.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:video_player/video_player.dart';

class WbVideo extends StatefulWidget {
  final String url;
  final String? previewImgUrl;

  /// 预览图片地址
  final bool showProgressText;

  /// 显示进度文本
  WbVideo(this.url,
      {Key? key, this.previewImgUrl, this.showProgressText = true})
      : super(key: key);

  @override
  State<WbVideo> createState() {
    return _WbVideoState();
  }
}

class _WbVideoState extends State<WbVideo> with WbVideoBLoC {
  _WbVideoState() {
    listener = () {
      if (mounted) {
        setState(() {});
      }
    };
  }
  Widget getPlayController() {
    return Offstage(
      offstage: !_showSeekBar,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
              child: IconButton(
            iconSize: 45,
            icon: Image.asset(_controller.value.isPlaying
                ? GlobalIcons.IC_PAUSE
                : GlobalIcons.IC_PLAY),
            onPressed: () {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            },
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Center(
              child: _controller.value.isBuffering
                  ? CircularProgressIndicator()
                  : null,
            ),
          )
        ],
      ),
    );
  }

  ///

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          GestureDetector(
            child: VideoPlayer(_controller),
            onTap: () {},
          ),
          getPlayController()
        ],
      ),
    );
  }
}

mixin WbVideoBLoC on State<WbVideo> {
  late VideoPlayerController _controller;
  late VoidCallback listener;
  bool _showSeekBar = true;

  @override
  void initState() {
    super.initState();
    print('播放#######${widget.url}');
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((value) {
        if (mounted) {
          /// 初始化完成后，更新状态
          setState(() {});
          if (_controller.value.duration == _controller.value.position) {
            _controller.seekTo(Duration(seconds: 0));
            setState(() {});
          }
        }
      });
    _controller.setLooping(true);
    _controller.addListener(listener);
  }

  @override
  void deactivate() {
    _controller.removeListener(listener);
    super.deactivate();
  }

  void setUrl(String url) {
    if (mounted) {
      _controller.removeListener(listener);
      _controller.pause();
      _controller = VideoPlayerController.network(widget.url)
        ..initialize().then((value) {
          if (mounted) {
            /// 初始化完成后，更新状态
            setState(() {});
            if (_controller.value.duration == _controller.value.position) {
              _controller.seekTo(Duration(seconds: 0));
              setState(() {});
            }
          }
        });
      _controller.addListener(listener);
    }
  }
}
