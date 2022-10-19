/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-19 18:59:49
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-19 20:16:48
 * @FilePath: /flutter_clone_github/lib/widgets/diff_scale_text.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/styles.dart';

class DiffScaleText extends StatefulWidget {
  final String? text;
  final TextStyle? textStyle;
  const DiffScaleText({Key? key, required this.text, this.textStyle})
      : super(key: key);

  @override
  State<DiffScaleText> createState() => _DiffScaleTextState();
}

class _DiffScaleTextState extends State<DiffScaleText>
    with TickerProviderStateMixin<DiffScaleText> {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _animationController.addStatusListener((status) {});
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle =
        widget.textStyle ?? TextStyle(fontSize: 20, color: GlobalColors.white);
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return RepaintBoundary(
          child: CustomPaint(
            child: Text(widget.text ?? '',
                style:
                    textStyle.merge(const TextStyle(color: Color(0x00000000))),
                maxLines: 1,
                textDirection: TextDirection.ltr),
          ),
        );
      },
    );
  }
}
