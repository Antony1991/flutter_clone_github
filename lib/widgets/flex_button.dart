import 'package:flutter/material.dart';

class FlexButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color textColor;
  final double fontSize;
  final VoidCallback? onPress;
  final int maxLines;
  final MainAxisAlignment mainAxisAlignment;

  const FlexButton(
      {Key? key,
      this.text,
      this.color,
      this.textColor = Colors.black,
      this.onPress,
      this.fontSize = 20.0,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () {
          onPress?.call();
        },
        child: Flex(
          mainAxisAlignment: mainAxisAlignment,
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
                child: Text(text!,
                    style: TextStyle(color: textColor, fontSize: fontSize),
                    textAlign: TextAlign.center,
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis))
          ],
        ));
  }
}
