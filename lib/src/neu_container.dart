import 'package:flutter/material.dart';

/// A container widget that implements the Neu Brutalism design style.
///
/// The Neu Brutalism style typically features high contrast elements with
/// bold borders, solid colors, and pronounced shadows to create a raw,
/// tactile appearance.
class NeuContainer extends StatelessWidget {
  /// Creates a container with Neu Brutalism styling.
  ///
  /// The [child] parameter is optional but typically used to display content
  /// within the container.
  ///
  /// If [width] and [height] are not specified, the container will size itself
  /// to fit its [child] or fill the available space if no child is provided.
  const NeuContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = EdgeInsets.zero,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.primaryBorderWidth = 2.0,
    this.secondaryBorderWidth = 1.0,
    this.borderRadius = 6.0,
    this.shadowOffset = const Offset(3, 3),
    this.shadowColor,
    this.shadowBlur = 0.0,
    this.onTap,
    this.showShadow = true,
    this.alignment = Alignment.center,
    this.duration = const Duration(milliseconds: 100),
  });

  /// The widget to display inside the container.
  final Widget? child;

  /// The width of the container. If null, the container will size itself to its child.
  final double? width;

  /// The height of the container. If null, the container will size itself to its child.
  final double? height;

  /// The padding inside the container.
  final EdgeInsetsGeometry padding;

  /// The margin around the container.
  final EdgeInsetsGeometry margin;

  /// The background color of the container.
  final Color backgroundColor;

  /// The color of the container's border.
  final Color borderColor;

  /// The width of the bottom and right borders (more pronounced).
  final double primaryBorderWidth;

  /// The width of the top and left borders (less pronounced).
  final double secondaryBorderWidth;

  /// The radius of the container's corners.
  final double borderRadius;

  /// The offset of the container's shadow.
  final Offset shadowOffset;

  /// The color of the container's shadow. If not specified, uses borderColor with opacity.
  final Color? shadowColor;

  /// The blur radius of the container's shadow.
  final double shadowBlur;

  /// Callback function when the container is tapped.
  final VoidCallback? onTap;

  /// Whether to show a shadow behind the container.
  final bool showShadow;

  /// The alignment of the child within the container.
  final AlignmentGeometry alignment;

  /// The duration of the animation.
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final effectiveShadowColor = shadowColor ?? borderColor.withValues(alpha: 0.7);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: duration,
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border(
            top: BorderSide(color: borderColor, width: secondaryBorderWidth),
            left: BorderSide(color: borderColor, width: secondaryBorderWidth),
            right: BorderSide(color: borderColor, width: primaryBorderWidth),
            bottom: BorderSide(color: borderColor, width: primaryBorderWidth),
          ),
          boxShadow: showShadow
              ? [
            BoxShadow(
              color: effectiveShadowColor,
              offset: shadowOffset,
              blurRadius: shadowBlur,
            ),
          ]
              : null,
        ),
        child: Padding(
          padding: padding,
          child: Align(
            alignment: alignment,
            child: child,
          ),
        ),
      ),
    );
  }

  /// Creates a copy of this NeuContainer with the given fields replaced with new values.
  NeuContainer copyWith({
    Key? key,
    Widget? child,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    Color? borderColor,
    double? primaryBorderWidth,
    double? secondaryBorderWidth,
    double? borderRadius,
    Offset? shadowOffset,
    Color? shadowColor,
    double? shadowBlur,
    VoidCallback? onTap,
    bool? showShadow,
    AlignmentGeometry? alignment,
    Duration? duration,
  }) {
    return NeuContainer(
      key: key ?? this.key,
      width: width ?? this.width,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      primaryBorderWidth: primaryBorderWidth ?? this.primaryBorderWidth,
      secondaryBorderWidth: secondaryBorderWidth ?? this.secondaryBorderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlur: shadowBlur ?? this.shadowBlur,
      onTap: onTap ?? this.onTap,
      showShadow: showShadow ?? this.showShadow,
      alignment: alignment ?? this.alignment,
      duration: duration ?? this.duration,
      child: child ?? this.child,
    );
  }
}