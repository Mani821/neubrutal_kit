import 'package:flutter/material.dart';

/// A Neubrutalism-styled button similar to ElevatedButton with customizable properties.
///
/// This button features the characteristic Neubrutalism design with thick borders,
/// a 3D shadow effect that animates when pressed, and customizable styling.
class NeuButton extends StatefulWidget {
  /// The child widget to display inside the button
  final Widget child;

  /// Callback function when the button is pressed
  final VoidCallback? onPressed;

  /// Padding inside the button
  final EdgeInsetsGeometry padding;

  /// Shadow width for the 3D effect
  final double shadowWidth;

  /// Background color of the button
  final Color backgroundColor;

  /// Border color of the button
  final Color borderColor;

  /// Corner radius of the button
  final double borderRadius;

  /// Border width for the top and left sides
  final double topLeftBorderWidth;

  /// Text style for any text inside the button
  final TextStyle? textStyle;

  /// Animation duration in milliseconds
  final int animationDurationMs;

  /// How much the button moves down when pressed (in pixels)
  final double pressedOffset;

  /// Minimum width of the button
  final double? minWidth;

  /// Minimum height of the button
  final double? minHeight;

  /// Alignment of the child widget within the button
  final AlignmentGeometry alignment;

  /// Creates a NeuButton with Neubrutalism styling.
  ///
  /// The [child] parameter is required.
  /// If [onPressed] is null, the button will appear disabled.
  const NeuButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.shadowWidth = 6.0,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderRadius = 8.0,
    this.topLeftBorderWidth = 1.8,
    this.textStyle,
    this.animationDurationMs = 40,
    this.pressedOffset = 2.0,
    this.minWidth,
    this.minHeight,
    this.alignment = Alignment.center,
  });

  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton>
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
      end: widget.topLeftBorderWidth, // Minimum shadow width when pressed (match top/left border)
    ).animate(_buttonController);
  }

  /// Handle the tap down event - start the press animation
  void _handleTapDown(TapDownDetails details) {
    if (widget.onPressed != null) {
      _buttonController.forward();
      setState(() => _isPressed = true);
    }
  }

  /// Handle the tap up event - reverse the animation and trigger the callback
  void _handleTapUp(TapUpDetails details) {
    if (widget.onPressed != null) {
      _buttonController.reverse();
      setState(() => _isPressed = false);
      widget.onPressed!(); // Call the onPressed callback
    }
  }

  /// Handle the tap cancel event - reverse the animation
  void _handleTapCancel() {
    if (widget.onPressed != null) {
      _buttonController.reverse();
      setState(() => _isPressed = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = widget.onPressed != null;

    final Color effectiveBackgroundColor = isEnabled
        ? widget.backgroundColor
        : widget.backgroundColor.withValues(alpha: 0.6);

    // Apply text style to any text widgets inside the button
    Widget buttonChild = widget.textStyle != null
        ? _applyTextStyle(widget.child, widget.textStyle!)
        : widget.child;

    // Build the button
    Widget buttonWidget = AnimatedBuilder(
      animation: _buttonController,
      builder: (context, child) {
        return GestureDetector(
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTapCancel: _handleTapCancel,
          child: MouseRegion(
            cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: widget.minWidth ?? 0.0,
                minHeight: widget.minHeight ?? 0.0,
              ),
              child: AnimatedContainer(
                duration: Duration(milliseconds: widget.animationDurationMs),
                padding: widget.padding,

                // Move button down slightly when pressed
                transform: Matrix4.translationValues(
                    0,
                    _isPressed ? widget.pressedOffset : 0.0,
                    0
                ),
                decoration: BoxDecoration(
                  color: effectiveBackgroundColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  // Create the 3D effect with different border widths
                  border: Border(
                    top: BorderSide(
                        color: widget.borderColor,
                        width: widget.topLeftBorderWidth
                    ),
                    left: BorderSide(
                        color: widget.borderColor,
                        width: widget.topLeftBorderWidth
                    ),
                    right: BorderSide(
                        color: widget.borderColor,
                        width: _shadowAnimation.value
                    ),
                    bottom: BorderSide(
                        color: widget.borderColor,
                        width: _shadowAnimation.value
                    ),
                  ),
                ),
                child: DefaultTextStyle(
                  style: DefaultTextStyle.of(context).style.merge(
                    TextStyle(
                      color: isEnabled ? Colors.black : Colors.black54,
                    ),
                  ),
                  child: Align(
                    alignment: widget.alignment,
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: buttonChild,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    // Material widget improves tap feedback and accessibility
    return Material(
      color: Colors.transparent,
      child: buttonWidget,
    );
  }

  /// Applies the given text style to any Text widgets found in the child widget tree
  Widget _applyTextStyle(Widget child, TextStyle style) {
    if (child is Text) {
      return Text(
        child.data ?? '',
        style: child.style?.merge(style) ?? style,
        textAlign: child.textAlign,
        overflow: child.overflow,
        maxLines: child.maxLines,
        semanticsLabel: child.semanticsLabel,
        softWrap: child.softWrap,
        textDirection: child.textDirection,
      );
    } else if (child is Icon) {
      return Icon(
        child.icon,
        size: child.size,
        color: style.color,
      );
    } else if (child is Row || child is Column || child is Flex) {
      return Builder(
        builder: (context) {
          final Widget result = DefaultTextStyle(
            style: DefaultTextStyle.of(context).style.merge(style),
            child: child,
          );
          return result;
        },
      );
    }
    return child;
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }
}