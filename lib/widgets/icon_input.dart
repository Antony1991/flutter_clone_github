import 'package:flutter/material.dart';

class IconInput extends StatefulWidget {
  final String? hintText;
  final bool obscureText;
  final IconData? iconData;
  final ValueChanged<String>? onChanged;
  final TextStyle? textStyle;
  final  TextEditingController? controller;

  const IconInput({Key? key, this.hintText, this.iconData, this.onChanged, this.textStyle, this.controller, this.obscureText = false}) : super(key: key);

  @override
  State<IconInput> createState() => _IconInputState();
}

class _IconInputState extends State<IconInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        icon: widget.iconData == null ? null : Icon(widget.iconData)
      ),
    );
  }
}
