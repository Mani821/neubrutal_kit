import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Configuration class for NeubrutalistSnackBar.
///
/// This class holds the styling parameters for the snackbar,
/// allowing for consistent styling across the app.
class NeuSnackBarConfig {
  /// The background color of the snackbar.
  final Color backgroundColor;

  /// The text color used for the message.
  final Color textColor;

  /// The border color of the snackbar.
  final Color borderColor;

  /// The width of the primary borders (bottom and right).
  final double primaryBorderWidth;

  /// The width of the secondary borders (top and left).
  final double secondaryBorderWidth;

  /// The border radius of the snackbar corners.
  final double borderRadius;

  /// The elevation of the snackbar.
  final double elevation;

  /// Default padding around content.
  final EdgeInsets contentPadding;

  /// Typography style for the main message.
  final TextStyle? messageStyle;

  /// Typography style for the action button.
  final TextStyle? actionStyle;

  /// Creates a configuration for neubrutalist snackbars.
  const NeuSnackBarConfig({
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    this.primaryBorderWidth = 5.0,
    this.secondaryBorderWidth = 1.5,
    this.borderRadius = 8.0,
    this.elevation = 6.0,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ),
    this.messageStyle,
    this.actionStyle,
  });
}

/// A neubrutalist-styled SnackBar widget.
///
/// This widget creates a SnackBar with pronounced borders and bold styling
/// consistent with the neubrutalist design aesthetic.
class NeuSnackBar extends SnackBar {
  /// Creates a neubrutalist-styled snackbar.
  ///
  /// The [content] argument must not be null.
  ///
  /// The [config] allows customization of the snackbar's appearance.
  /// If not provided, default styling will be used.
  NeuSnackBar({
    required super.content,
    super.key,
    Color? backgroundColor,
    super.duration,
    super.action,
    super.animation,
    super.onVisible,
    NeuSnackBarConfig? config,
    bool animate = true,
    Duration animationDuration = const Duration(milliseconds: 400),
    Curve animationCurve = Curves.easeOutQuint,
  }) : super(
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(config?.borderRadius ?? 8.0),
    ),
  );

  /// Shows a neubrutalist snackbar with the given [message].
  ///
  /// The [action] is optional and provides a button for the user to interact with.
  /// The [actionLabel] is the text displayed on the action button.
  ///
  /// The [config] allows customization of the snackbar's appearance.
  static void show({
    required BuildContext context,
    required String message,
    VoidCallback? action,
    String actionLabel = 'OK',
    NeuSnackBarConfig? config,
    Duration? duration,
    bool animate = true,
    Duration animationDuration = const Duration(milliseconds: 400),
    Curve animationCurve = Curves.easeOutQuint,
  }) {
    final cfg = config ?? const NeuSnackBarConfig();

    Widget snackBarContent = Container(
      decoration: BoxDecoration(
        color: cfg.backgroundColor,
        borderRadius: BorderRadius.circular(cfg.borderRadius),
        border: Border(
          bottom: BorderSide(
            color: cfg.borderColor,
            width: cfg.primaryBorderWidth,
          ),
          right: BorderSide(
            color: cfg.borderColor,
            width: cfg.primaryBorderWidth,
          ),
          top: BorderSide(
            color: cfg.borderColor,
            width: cfg.secondaryBorderWidth,
          ),
          left: BorderSide(
            color: cfg.borderColor,
            width: cfg.secondaryBorderWidth,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: cfg.borderColor.withValues(alpha: 0.3),
            offset: const Offset(4, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: cfg.contentPadding,
        child: Row(
          children: [
            Expanded(
              child: Text(
                message,
                style:
                cfg.messageStyle ??
                    TextStyle(
                      color: cfg.textColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            if (action != null)
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  action();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(cfg.borderColor),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(color: cfg.borderColor, width: 2),
                    ),
                  ),
                  padding: WidgetStatePropertyAll(
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  ),
                ),
                child: Text(
                  actionLabel,
                  style:
                  cfg.actionStyle ??
                      TextStyle(
                        color: cfg.backgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
          ],
        ),
      ),
    );

    // Create custom snackbar widget with entrance and exit animations
    final effectiveDuration = duration ?? const Duration(seconds: 4);

    // We'll use a custom widget to handle the entrance and exit animations
    final animatedSnackBarContent = _AnimatedNeubrutalistSnackBar(
      content: snackBarContent,
      animate: animate,
      animationDuration: animationDuration,
      animationCurve: animationCurve,
      totalDisplayDuration: effectiveDuration,
    );

    final snackBar = SnackBar(
      content: animatedSnackBarContent,
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration:
      effectiveDuration +
          animationDuration * 2, // Add time for both animations
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.all(8),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class _AnimatedNeubrutalistSnackBar extends StatefulWidget {
  final Widget content;
  final bool animate;
  final Duration animationDuration;
  final Curve animationCurve;
  final Duration totalDisplayDuration;

  const _AnimatedNeubrutalistSnackBar({
    required this.content,
    required this.animate,
    required this.animationDuration,
    required this.animationCurve,
    required this.totalDisplayDuration,
  });

  @override
  State<_AnimatedNeubrutalistSnackBar> createState() =>
      _AnimatedNeubrutalistSnackBarState();
}

class _AnimatedNeubrutalistSnackBarState
    extends State<_AnimatedNeubrutalistSnackBar> {
  bool _exiting = false;

  @override
  void initState() {
    super.initState();

    if (widget.animate) {
      // Schedule exit animation to start before the snackbar is dismissed
      Future.delayed(
        widget.totalDisplayDuration - widget.animationDuration,
            () {
          if (mounted) {
            setState(() {
              _exiting = true;
            });
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.animate) {
      return widget.content;
    }

    return AnimatedOpacity(
      opacity: _exiting ? 0.0 : 1.0,
      duration: widget.animationDuration,
      curve: widget.animationCurve,
      child: AnimatedSlide(
        offset: _exiting ? const Offset(0, 1) : Offset.zero,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
        child: widget.content
            .animate()
            .slide(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
          duration: widget.animationDuration,
          curve: widget.animationCurve,
        )
            .fadeIn(
          duration: widget.animationDuration * 0.7,
          curve: widget.animationCurve,
        ),
      ),
    );
  }
}

/// Example usage:
///
/// ```dart
/// // Simple usage with default styling
/// NeubrutalistSnackBar.show(
///   context: context,
///   message: 'Item saved successfully!',
/// );
///
/// // Advanced usage with custom action and styling
/// NeubrutalistSnackBar.show(
///   context: context,
///   message: 'Profile updated',
///   action: () => print('Action pressed'),
///   actionLabel: 'View',
///   config: const NeuSnackBarConfig(
///     backgroundColor: Colors.yellow,
///     borderColor: Colors.black,
///     textColor: Colors.black,
///     borderRadius: 12.0,
///   ),
/// );
/// ```
