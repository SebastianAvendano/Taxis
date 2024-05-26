import 'package:rive/rive.dart';
import 'package:flutter/material.dart';

class AnimatedBottomBarIcon extends StatefulWidget {
  const AnimatedBottomBarIcon({
    super.key,
    required this.urlAsset,
    required this.isActive,
  });

  final bool isActive;
  final String urlAsset;

  @override
  State<AnimatedBottomBarIcon> createState() => _AnimatedBottomBarIconState();
}

class _AnimatedBottomBarIconState extends State<AnimatedBottomBarIcon> {
  late SMIBool? _activeAnimation;
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation(
      'start_animation',
      autoplay: widget.isActive,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _activeAnimation?.controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedBottomBarIcon oldWidget) {
    _activeAnimation?.change(widget.isActive);
    super.didUpdateWidget(oldWidget);
  }

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      'state_machine',
    );
    artboard.addController(controller!);
    _activeAnimation = controller.findSMI('active')?..value = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      margin: const EdgeInsets.only(bottom: 4),
      child: RiveAnimation.asset(
        widget.urlAsset,
        animations: const ['start_animation', 'finish_animation'],
        controllers: [_controller],
        fit: BoxFit.contain,
        onInit: _onRiveInit,
      ),
    );
  }
}
