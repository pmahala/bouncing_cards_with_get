import 'package:flutter/widgets.dart';
import 'package:flutter_animator/flutter_animator.dart';

class LeftRightShake extends AnimatorWidget {
  LeftRightShake({
    Key? key,
    required Widget child,
    AnimationPreferences preferences = const AnimationPreferences(),
  }) : super(
          key: key,
          child: child,
          definition:
              ShakeAnimation(preferences: preferences, first: -5, second: 5),
        );
}

class RightLeftShake extends AnimatorWidget {
  RightLeftShake({
    Key? key,
    required Widget child,
    AnimationPreferences preferences = const AnimationPreferences(),
  }) : super(
          key: key,
          child: child,
          definition:
              ShakeAnimation(preferences: preferences, first: 8, second: -2),
        );
}

class ShakeAnimation extends AnimationDefinition {
  final double first;
  final double second;

  ShakeAnimation({
    required this.first,
    required this.second,
    AnimationPreferences preferences = const AnimationPreferences(),
  }) : super(preferences: preferences);

  @override
  Widget build(BuildContext context, Animator animator, Widget child) =>
      AnimatedBuilder(
        animation: animator.controller,
        child: child,
        builder: (BuildContext context, Widget? child) => Transform(
          child: child,
          transform: Matrix4.translationValues(
            animator.get("translateX")?.value,
            0.0,
            0.0,
          ),
          alignment: FractionalOffset(0.5, 0.5),
        ),
      );

  @override
  Map<String, TweenList> getDefinition({Size? screenSize, Size? widgetSize}) {
    const origin = 0.0;

    return {
      "translateX": TweenList<double>(
        [
          TweenPercentage(percent: 0, value: origin),
          TweenPercentage(percent: 20, value: first),
          TweenPercentage(percent: 80, value: second),
          TweenPercentage(percent: 100, value: origin),
        ],
      ),
    };
  }
}
