import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A Neubrutalism-styled checkbox with customizable properties and animation effects.
///
/// This checkbox features the characteristic Neubrutalism design with thick borders,
/// a 3D shadow effect that transforms when checked, and customizable appearance.
class NeuCheckbox extends StatelessWidget {
  /// Whether the checkbox is checked
  final bool value;

  /// Callback function when the checkbox state changes
  final ValueChanged<bool>? onChanged;

  /// Size of the checkbox (width and height will be the same)
  final double size;

  /// Minimum size constraint for the checkbox
  final double? minSize;

  /// Maximum size constraint for the checkbox
  final double? maxSize;

  /// Color when the checkbox is checked
  final Color activeColor;

  /// Color when the checkbox is unchecked
  final Color inactiveColor;

  /// Border color of the checkbox
  final Color borderColor;

  /// Color of the check mark (if using the default check)
  final Color checkColor;

  /// Corner radius of the checkbox
  final double borderRadius;

  /// Animation duration in milliseconds
  final int animationDurationMs;

  /// Shadow width for the unchecked state
  final double shadowWidth;

  /// Border width for the top and left sides
  final double topLeftBorderWidth;

  /// Offset for the X direction when checked
  final double checkedOffsetX;

  /// Offset for the Y direction when checked
  final double checkedOffsetY;

  /// Custom widget to use as the check mark
  /// If null, the default check mark will be used
  final Widget? customCheckWidget;

  /// Asset path for the check icon
  /// Only used if [customCheckWidget] is null
  final String? checkIconAsset;

  /// Creates a NeuCheckbox with Neubrutalism styling.
  ///
  /// The [value] and [onChanged] parameters are required.
  /// All other parameters have sensible defaults that match the Neubrutalism style
  /// but can be customized to fit your design needs.
  const NeuCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 30.0,
    this.minSize,
    this.maxSize,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.white,
    this.borderColor = Colors.black,
    this.checkColor = Colors.white,
    this.borderRadius = 6.0,
    this.animationDurationMs = 140,
    this.shadowWidth = 5.0,
    this.topLeftBorderWidth = 1.5,
    this.checkedOffsetX = 2.0,
    this.checkedOffsetY = 1.4,
    this.customCheckWidget,
    this.checkIconAsset,
  });

  @override
  Widget build(BuildContext context) {
    // Apply min/max size constraints if provided
    Widget checkbox = ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minSize ?? size,
        minHeight: minSize ?? size,
        maxWidth: maxSize ?? double.infinity,
        maxHeight: maxSize ?? double.infinity,
      ),
      child: GestureDetector(
        onTap:
        onChanged == null
            ? null
            : () {
          onChanged!(!value);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: animationDurationMs),
          height: size,
          width: size,
          // Apply translation effect when checked - gives the impression
          // of the checkbox being "pressed down"
          transform: Matrix4.translationValues(
            value ? checkedOffsetX : 0,
            value ? checkedOffsetY : 0.0,
            0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            // Create the 3D effect with different border widths
            border: Border(
              top: BorderSide(color: borderColor, width: topLeftBorderWidth),
              left: BorderSide(color: borderColor, width: topLeftBorderWidth),
              right: BorderSide(
                color: borderColor,
                width: value ? topLeftBorderWidth : shadowWidth,
              ),
              bottom: BorderSide(
                color: borderColor,
                width: value ? topLeftBorderWidth : shadowWidth,
              ),
            ),
            // Change color based on checked state
            color: value ? activeColor : inactiveColor,
          ),
          // Show check mark when checked
          child: value ? Center(child: _buildCheckmark()) : null,
        ),
      ),
    );

    // Material widget improves tap feedback and accessibility
    return Material(color: Colors.transparent, child: checkbox);
  }

  /// Builds the checkmark to display when the checkbox is checked
  Widget _buildCheckmark() {
    // If a custom check widget is provided, use it
    if (customCheckWidget != null) {
      return customCheckWidget!.animate().scale(duration: 200.ms);
    }

    // If a custom asset path is provided, use it
    if (checkIconAsset != null) {
      return Image.asset(
        checkIconAsset!,
        color: checkColor,
      ).animate().scale(duration: 200.ms);
    }

    // Otherwise use a default icon
    return Icon(
      Icons.check,
      color: checkColor,
      size: size * 0.7,
    ).animate().scale(duration: 200.ms);
  }
}
