import 'package:flutter/material.dart';

class StartAnimation extends StatefulWidget {
  final AnimationController buttonController;
  late final Animation<double> shrinkButtonAnimation;

  StartAnimation({Key? key, required this.buttonController})
      : shrinkButtonAnimation = Tween<double>(
          begin: 320.0,
          end: 70.0,
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: const Interval(0.0, 0.150),
          ),
        ),
        super(key: key);

  @override
  _StartAnimationState createState() => _StartAnimationState();
}

class _StartAnimationState extends State<StartAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.shrinkButtonAnimation,
      builder: (context, child) => Container(
        width: widget.shrinkButtonAnimation.value,
        height: 60.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red[700],
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        ),
        child: widget.shrinkButtonAnimation.value > 75
            ? const Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.3,
                ),
              )
            : const CircularProgressIndicator(
                strokeWidth: 1.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
      ),
    );
  }
}
