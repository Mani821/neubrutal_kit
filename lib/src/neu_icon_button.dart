import 'package:flutter/material.dart';

/// A Neubrutalism-styled icon button with customizable properties and animation effects.
///
/// This button features the characteristic Neubrutalism design with thick borders,
/// a 3D shadow effect that animates when pressed, and highly customizable styling options.
class NeuIconButton extends StatefulWidget {


  /// Callback function when the button is pressed
  final VoidCallback onPressed;

  /// Internal padding around the child widget
  final double padding;

  /// The shadow/border width when the button is not pressed
  final double shadowWidth;

  /// Corner radius of the button
  final double borderRadius;

  /// Color of the button background
  final Color backgroundColor;

  /// Color of the button border/shadow
  final Color borderColor;

  /// Animation duration in milliseconds
  final int animationDurationMs;

  /// How much the button moves down when pressed (in pixels)
  final double pressedOffset;

  /// Border width for the top and left sides
  final double topLeftBorderWidth;

  /// The widget to display inside the button (typically an Icon)
  final Widget child;

  /// Creates a NeuIconButton with Neubrutalism styling.
  ///
  /// The [child] and [onPressed] parameters are required.
  /// All other parameters have sensible defaults that match the Neubrutalism style
  /// but can be customized to fit your design needs.
  const NeuIconButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding = 12.0,
    this.shadowWidth = 6.0,
    this.borderRadius = 8.0,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.animationDurationMs = 40,
    this.pressedOffset = 2.0,
    this.topLeftBorderWidth = 1.8,
  });

  @override
  State<NeuIconButton> createState() => _NeuIconButtonState();
}

class _NeuIconButtonState extends State<NeuIconButton>
    with SingleTickerProviderStateMixin {
  /// Animation controller for the button press effect
  late AnimationController _buttonController;

  /// Animation for the border/shadow width transition
  late Animation<double> _shadowAnimation;

  /// Whether the button is currently pressed
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with the specified duration
    _buttonController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDurationMs),
    );

    // Create a tween animation for the shadow width
    _shadowAnimation = Tween<double>(
      begin: widget.shadowWidth, // Maximum shadow width when not pressed
      end:
      widget
          .topLeftBorderWidth, // Minimum shadow width when pressed (match top/left border)
    ).animate(_buttonController);
  }

  /// Handle the tap down event - start the press animation
  void _handleTapDown(TapDownDetails details) {
    _buttonController.forward();
    setState(() => _isPressed = true);
  }

  /// Handle the tap up event - reverse the animation and trigger the callback
  void _handleTapUp(TapUpDetails details) {
    _buttonController.reverse();
    setState(() => _isPressed = false);
    widget.onPressed(); // Call the onPressed callback
  }

  /// Handle the tap cancel event - reverse the animation
  void _handleTapCancel() {
    _buttonController.reverse();
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    // Define the button widget
    Widget buttonWidget = AnimatedBuilder(
      animation: _buttonController,
      builder: (context, child) {
        return GestureDetector(
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTapCancel: _handleTapCancel,
          child: AnimatedContainer(
            duration: Duration(milliseconds: widget.animationDurationMs),
            padding: EdgeInsets.all(widget.padding),
            // Move button down slightly when pressed
            transform: Matrix4.translationValues(
              0,
              _isPressed ? widget.pressedOffset : 0.0,
              0,
            ),
            decoration: BoxDecoration(
              color:
               widget.backgroundColor,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              // Create the 3D effect with different border widths
              border: Border(
                top: BorderSide(
                  color: widget.borderColor,
                  width: widget.topLeftBorderWidth,
                ),
                left: BorderSide(
                  color: widget.borderColor,
                  width: widget.topLeftBorderWidth,
                ),
                right: BorderSide(
                  color: widget.borderColor,
                  width: _shadowAnimation.value,
                ),
                bottom: BorderSide(
                  color: widget.borderColor,
                  width: _shadowAnimation.value,
                ),
              ),
            ),
            child: child,
          ),
        );
      },
      child: widget.child,
    );

    return buttonWidget;
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }
}
