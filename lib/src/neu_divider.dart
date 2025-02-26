import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A divider widget with neubrutalism styling.
///
/// This widget creates a container with pronounced borders and optional animation
/// to create a neubrutalism aesthetic. The divider can be customized with various
/// parameters like color, thickness, border radius, and animation properties.
class NeuDivider extends StatelessWidget {
  /// - [color]: The primary color of the divider and its borders.
  /// - [height]: The height of the divider container.
  /// - [width]: The width of the divider. If null, expands to fill available space.
  /// - [thickness]: The thickness of the divider line.
  /// - [borderRadius]: The radius of the divider's corners.
  /// - [primaryBorderWidth]: The width of the bottom and right borders (more pronounced).
  /// - [secondaryBorderWidth]: The width of the top and left borders (less pronounced).
  /// - [animate]: Whether to apply animation to the divider.
  /// - [animationDuration]: The duration of the animation if [animate] is true.
  /// - [animationCurve]: The curve to use for the animation if [animate] is true.
  /// - [key]: Widget key.
  const NeuDivider({
    super.key,
    this.color = Colors.black,
    this.borderRadius = 6,
    this.primaryBorderWidth = 2.2,
    this.secondaryBorderWidth = 1,
    this.animate = true,
    this.animationDuration = const Duration(seconds: 1),
    this.animationCurve = Curves.easeInOutQuint,
  });

  /// The primary color of the divider and its borders.
  final Color color;

  /// The radius of the divider's corners.
  final double borderRadius;

  /// The width of the bottom and right borders (more pronounced).
  final double primaryBorderWidth;

  /// The width of the top and left borders (less pronounced).
  final double secondaryBorderWidth;

  /// Whether to apply animation to the divider.
  final bool animate;

  /// The duration of the animation if [animate] is true.
  final Duration animationDuration;

  /// The curve to use for the animation if [animate] is true.
  final Curve animationCurve;

  @override
  Widget build(BuildContext context) {
    // Create the base container with neubrutalism styling
    Widget divider = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border(
          bottom: BorderSide(color: color, width: primaryBorderWidth),
          top: BorderSide(color: color, width: secondaryBorderWidth),
          left: BorderSide(color: color, width: secondaryBorderWidth),
          right: BorderSide(color: color, width: primaryBorderWidth),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          5,
              (index) =>
          index == 4
              ? Container(
            transform: Matrix4.rotationZ(0.5),
            height: 2,
            width: 1.6,
            color: color,
          )
              : const SizedBox(),
        ),
      ),
    );

    // Apply animation if enabled
    if (animate) {
      return divider.animate().scale(
        alignment: Alignment.centerLeft,
        duration: animationDuration,
        curve: animationCurve,
      );
    }

    return divider;
  }
}
