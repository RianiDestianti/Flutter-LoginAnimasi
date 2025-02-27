import 'package:flutter/material.dart';

class StartAnimation extends StatefulWidget {
  final AnimationController buttonController;
  late final Animation<double> shrinkButtonAnimation;
  late final Animation<double> zoomAnimation;

  StartAnimation({Key? key, required this.buttonController}) : super(key: key) {
    shrinkButtonAnimation = Tween<double>(
      begin: 320.0,
      end: 70.0,
    ).animate(
      CurvedAnimation(
        parent: buttonController,
        curve: const Interval(0.0, 0.150),
      ),
    );

    // Make the zoom animation expand to a much larger size to ensure it covers the screen
    zoomAnimation = Tween<double>(
      begin: 70.0,
      end: 2000.0, // Increased from 900 to 2000 to ensure full coverage
    ).animate(
      CurvedAnimation(
        parent: buttonController,
        curve: const Interval(
          0.550,
          0.999,
          curve: Curves.bounceInOut,
        ),
      ),
    );
  }

  @override
  _StartAnimationState createState() => _StartAnimationState();
}

class _StartAnimationState extends State<StartAnimation> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // Calculate the diagonal of the screen to ensure full coverage
    final double screenDiagonal = 
        MediaQuery.of(context).size.height > MediaQuery.of(context).size.width 
            ? MediaQuery.of(context).size.height * 1.5
            : MediaQuery.of(context).size.width * 1.5;
            
    return AnimatedBuilder(
      animation: widget.buttonController,
      builder: (context, child) => Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.zoomAnimation.value,
              height: widget.zoomAnimation.value,
              decoration: BoxDecoration(
                shape: widget.zoomAnimation.value < 600
                    ? BoxShape.circle
                    : BoxShape.rectangle,
                color: Colors.red[700],
              ),
            ),
            Container(
              width: widget.shrinkButtonAnimation.value,
              height: 60.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red[700],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: widget.zoomAnimation.value <= 300
                  ? (widget.shrinkButtonAnimation.value > 75
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
                        ))
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}


