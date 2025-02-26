import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A Neubrutalism-styled radio button with customizable properties and animation effects.
///
/// This radio button features the characteristic Neubrutalism design with thick borders,
/// a 3D shadow effect that transforms when selected, and customizable appearance.
class NeuRadio<T> extends StatelessWidget {
  /// The value represented by this radio button
  final T value;

  /// The currently selected value for the radio button group
  final T groupValue;

  /// Callback function when the radio button is selected
  final ValueChanged<T>? onChanged;

  /// Size of the radio button (width and height will be the same)
  final double size;

  /// Minimum size constraint for the radio button
  final double? minSize;

  /// Maximum size constraint for the radio button
  final double? maxSize;

  /// Color when the radio button is selected
  final Color activeColor;

  /// Color when the radio button is not selected
  final Color inactiveColor;

  /// Border color of the radio button
  final Color borderColor;

  /// Color of the inner circle when selected
  final Color indicatorColor;

  /// Animation duration in milliseconds
  final int animationDurationMs;

  /// Shadow width for the unselected state
  final double shadowWidth;

  /// Border width for the top and left sides
  final double topLeftBorderWidth;

  /// Offset for the X direction when selected
  final double selectedOffsetX;

  /// Offset for the Y direction when selected
  final double selectedOffsetY;

  /// Custom widget to use as the indicator when selected
  /// If null, the default circle indicator will be used
  final Widget? customIndicatorWidget;

  /// Creates a NeuRadio with Neubrutalism styling.
  ///
  /// The [value], [groupValue], and [onChanged] parameters are required.
  /// All other parameters have sensible defaults that match the Neubrutalism style
  /// but can be customized to fit your design needs.
  const NeuRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.size = 30.0,
    this.minSize,
    this.maxSize,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.white,
    this.borderColor = Colors.black,
    this.indicatorColor = Colors.white,
    this.animationDurationMs = 140,
    this.shadowWidth = 5.0,
    this.topLeftBorderWidth = 1.5,
    this.selectedOffsetX = 2.0,
    this.selectedOffsetY = 1.4,
    this.customIndicatorWidget,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if this radio button is selected
    final bool isSelected = value == groupValue;

    // Apply min/max size constraints if provided
    Widget radio = ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minSize ?? size,
        minHeight: minSize ?? size,
        maxWidth: maxSize ?? double.infinity,
        maxHeight: maxSize ?? double.infinity,
      ),
      child: GestureDetector(
        // Inside your NeuRadio class, change the GestureDetector's onTap:
        onTap: onChanged == null
            ? null
            : () {
          // Always call onChanged, regardless of selection state
          onChanged!(value);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: animationDurationMs),
          height: size,
          width: size,
          // Apply translation effect when selected - gives the impression
          // of the radio button being "pressed down"
          transform: Matrix4.translationValues(
            isSelected ? selectedOffsetX : 0,
            isSelected ? selectedOffsetY : 0.0,
            0,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // Create the 3D effect with different border widths
            border: Border(
              top: BorderSide(color: borderColor, width: topLeftBorderWidth),
              left: BorderSide(color: borderColor, width: topLeftBorderWidth),
              right: BorderSide(
                color: borderColor,
                width: isSelected ? topLeftBorderWidth : shadowWidth,
              ),
              bottom: BorderSide(
                color: borderColor,
                width: isSelected ? topLeftBorderWidth : shadowWidth,
              ),
            ),
            // Change color based on selected state
            color: isSelected ? activeColor : inactiveColor,
          ),
          // Show indicator when selected
          child: isSelected ? Center(child: _buildIndicator()) : null,
        ),
      ),
    );

    // Material widget improves tap feedback and accessibility
    return Material(color: Colors.transparent, child: radio);
  }

  /// Builds the indicator to display when the radio is selected
  Widget _buildIndicator() {
    // If a custom indicator widget is provided, use it
    if (customIndicatorWidget != null) {
      return customIndicatorWidget!.animate().scale(duration: 200.ms);
    }

    // Otherwise use a default circular indicator
    return Container(
      width: size * 0.45,
      height: size * 0.45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: indicatorColor,
      ),
    ).animate().scale(duration: 200.ms);
  }
}