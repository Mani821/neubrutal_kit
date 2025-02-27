import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customizable neubrutalist-styled toggle switch.
///
/// This widget provides a bold, tactile switch with customizable text labels,
/// colors, and animation properties. It follows the neubrutalism design aesthetic
/// with pronounced borders and playful interactions.
class NeuSwitch extends StatefulWidget {
  /// Creates a neubrutalist toggle switch.
  ///
  /// The [value] and [onChanged] parameters are required.
  const NeuSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.width = 65.0,
    this.height = 34.0,
    this.thumbWidth = 32.25,
    this.borderRadius = 8.0,
    this.thumbBorderRadius = 3.0,
    this.backgroundColor = Colors.transparent,
    this.activeBorderColor = Colors.black,
    this.inactiveBorderColor = Colors.black,
    this.activeThumbColor = Colors.blue,
    this.inactiveThumbColor = Colors.white,
    this.primaryBorderWidth = 6.0,
    this.secondaryBorderWidth = 1.6,
    this.thumbBorderWidth = 1.6,
    this.toggleDuration = const Duration(milliseconds: 140),
    this.slideDuration = const Duration(milliseconds: 400),
    this.slideCurve = Curves.easeInOutQuint,
    this.disabled = false,
    this.disabledOpacity = 0.5,
    this.disableFeedback = false,
  });

  /// Whether this switch is on or off.
  final bool value;

  /// Called when the user toggles the switch on or off.
  final ValueChanged<bool> onChanged;

  /// The width of the switch.
  final double width;

  /// The height of the switch.
  final double height;

  /// The width of the sliding thumb.
  final double thumbWidth;

  /// The border radius of the switch.
  final double borderRadius;

  /// The border radius of the thumb.
  final double thumbBorderRadius;

  /// The background color of the switch track.
  final Color backgroundColor;

  /// The border color when the switch is active (on).
  final Color activeBorderColor;

  /// The border color when the switch is inactive (off).
  final Color inactiveBorderColor;

  /// The color of the thumb when the switch is active (on).
  final Color activeThumbColor;

  /// The color of the thumb when the switch is inactive (off).
  final Color inactiveThumbColor;

  /// The width of the primary borders (bottom and right).
  final double primaryBorderWidth;

  /// The width of the secondary borders (top and left).
  final double secondaryBorderWidth;

  /// The width of the thumb borders.
  final double thumbBorderWidth;

  /// The duration of the color/size animations.
  final Duration toggleDuration;

  /// The duration of the sliding thumb animation.
  final Duration slideDuration;

  /// The curve to use for the sliding animation.
  final Curve slideCurve;

  /// Whether the switch is disabled.
  final bool disabled;

  /// The opacity to apply when the switch is disabled.
  final double disabledOpacity;

  /// For disabling the visual feedback of the switch.
  final bool disableFeedback;

  @override
  State<NeuSwitch> createState() => _NeuSwitchState();
}

class _NeuSwitchState extends State<NeuSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(NeuSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _value = widget.value;
    }
  }

  void _updateValue(bool newValue) {
    if (widget.disabled) return;

    setState(() {
      _value = newValue;
    });

    if (!widget.disableFeedback) {
      HapticFeedback.lightImpact();
    }

    widget.onChanged(newValue);
  }

  Color get _effectiveBorderColor {
    return _value ? widget.activeBorderColor : widget.inactiveBorderColor;
  }

  Color get _effectiveThumbColor {
    return _value ? widget.activeThumbColor : widget.inactiveThumbColor;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disabled ? widget.disabledOpacity : 1.0,
      child: GestureDetector(
        onTap: () => _updateValue(!_value),
        child: AnimatedContainer(
          duration: widget.toggleDuration,
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border(
              top: BorderSide(
                color: _effectiveBorderColor,
                width: widget.secondaryBorderWidth,
              ),
              left: BorderSide(
                color: _effectiveBorderColor,
                width: widget.secondaryBorderWidth,
              ),
              right: BorderSide(
                color: _effectiveBorderColor,
                width: widget.primaryBorderWidth,
              ),
              bottom: BorderSide(
                color: _effectiveBorderColor,
                width: widget.primaryBorderWidth,
              ),
            ),
            color: widget.backgroundColor,
          ),
          child: AnimatedAlign(
            duration: widget.slideDuration,
            curve: widget.slideCurve,
            alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
            child: AnimatedContainer(
              duration: widget.toggleDuration,
              height: widget.height * 0.8,
              width: widget.thumbWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.thumbBorderRadius),
                border: Border.all(
                  color: _effectiveBorderColor,
                  width: widget.thumbBorderWidth,
                ),
                color: _effectiveThumbColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Example usage:
///
/// ```dart
/// NeuSwitch(
///   value: _switchValue,
///   onChanged: (value) => setState(() => _switchValue = value),
///   firstText: "KG",
///   secondText: "LBs",
///   activeThumbColor: Color(0xFFFFD978),
/// )
/// ```
