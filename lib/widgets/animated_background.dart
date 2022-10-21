import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}
enum _ColorTween{color1, color2}
class _AnimatedBackgroundState extends State<AnimatedBackground> {
  @override
  Widget build(BuildContext context) {
    return MirrorAnimationBuilder<Color?>(tween: ColorTween(begin: Colors.lightBlue.shade900, end: Colors.blue.shade600), duration: Duration(seconds: 3),
        builder: (context, value, _) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.lightBlue.shade900, Colors.blue.shade600]
                )
            ),
          );
        }
    );
  }
}
