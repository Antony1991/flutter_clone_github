/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-19 16:36:23
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-19 20:16:50
 * @FilePath: /flutter_clone_github/lib/widgets/mole_widget.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clone_github/common/style/styles.dart';
import 'package:simple_animations/simple_animations.dart';

class MoleWidget extends StatefulWidget {
  const MoleWidget({super.key});

  @override
  State<MoleWidget> createState() => _MoleWidgetState();
}

class _MoleWidgetState extends State<MoleWidget> {
  final List<MoleParticle> particles = [];
  bool _moleIsVisible = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      _hitMole();
    });
    super.initState();
  }

  _hitMole() {
    for (var i in Iterable.generate(50)) {
      particles.add(MoleParticle());
    }
  }

  Widget _mole() {
    return Container(
      decoration: BoxDecoration(
          color: GlobalColors.primaryValue,
          borderRadius: BorderRadius.circular(50)),
    );
  }

  Widget _buildMole() {
    _manageParticleLifecycle();
    return LoopAnimationBuilder(
      tween: ConstantTween(1),
      duration: const Duration(seconds: 2),
      builder: ((context, value, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            if (_moleIsVisible)
              GestureDetector(
                onTap: () => _hitMole(),
                child: _mole(),
              ),
            ...particles.map((it) => it.buildWidget())
          ],
        );
      }),
    );
  }

  void _setMoleVisible(bool visible) {
    setState(() {
      _moleIsVisible = visible;
    });
  }

  void _restartMole() async {
    var respawnTime = (2000 + Random().nextInt(8000));
    await Future.delayed(Duration(milliseconds: respawnTime));
    _setMoleVisible(true);
    var timeVisible = (500 + Random().nextInt(1500));
    await Future.delayed(Duration(milliseconds: timeVisible));
    _setMoleVisible(false);
    _restartMole();
  }

  _manageParticleLifecycle() {
    particles.removeWhere((particle) {
      return particle.progress() == 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: _buildMole(),
    );
  }
}

enum _MoleProps { x, y, scale }

class MoleParticle {
  late Animatable<Tween> tween;
  late Duration startTime;
  final duration = 600;

  MoleParticle() {
    final random = Random();
    final x = (100 + 200) * random.nextDouble() * (random.nextBool() ? 1 : -1);
    final y = (100 + 200) * random.nextDouble() * (random.nextBool() ? 1 : -1);

    tween = MultiTrackTween<_MoleProps>()
      ..add(_MoleProps.x, 0.0.tweenTo(x))
      ..add(_MoleProps.y, 0.0.tweenTo(y))
      ..add(_MoleProps.scale, 1.0.tweenTo(0, 0));

    startTime = DateTime.now().duration();
  }

  Widget buildWidget() {
    final MultiTweenValues<_MoleProps> values = tween.transform(progress());
    var alpha = (255 * progress()).toInt();
    return Positioned(
      left: values.get(_MoleProps.x),
      top: values.get(_MoleProps.y),
      child: Transform.scale(
        scale: values.get(_MoleProps.scale),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: GlobalColors.primaryValue.withAlpha(alpha),
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }

  double progress() {
    return ((DateTime.now().duration() - startTime) / duration)
        .clamp(0.0, 1.0)
        .toDouble();
  }
}
