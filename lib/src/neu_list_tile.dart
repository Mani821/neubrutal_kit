import 'package:flutter/material.dart';

/// A customizable neubrutalist-styled list tile for use in lists and menus.
///
/// The [NeuListTile] provides a bold, tactile appearance with customizable borders,
/// colors, and optional hover/press effects that match the neubrutalism design aesthetic.
class NeuListTile extends StatefulWidget {
  /// Creates a neubrutalist list tile.
  ///
  /// The [title] argument is required and typically a [Text] widget.
  const NeuListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.backgroundColor = Colors.white,
    this.selectedBackgroundColor,
    this.borderColor = Colors.black,
    this.primaryBorderWidth = 3.4,
    this.secondaryBorderWidth = 1.5,
    this.borderRadius = 8.0,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    this.elevation = 0.0,
    this.hoverElevation = 4.0,
    this.animationDuration = const Duration(milliseconds: 30),
    this.titleStyle,
    this.subtitleStyle,
    this.showShadow = true,
    this.shadowOffset = const Offset(4, 4),
    this.shadowColor,
    this.dense = false,
    this.compressedBorderWidth = 1.6,
    this.pressedOffset = 2.0,
  });

  /// The primary content of the list tile.
  final Widget title;

  /// Additional content displayed below the title.
  final Widget? subtitle;

  /// A widget to display before the title.
  final Widget? leading;

  /// A widget to display after the title.
  final Widget? trailing;

  /// Called when the user taps this list tile.
  final VoidCallback? onTap;

  /// Called when the user long-presses this list tile.
  final VoidCallback? onLongPress;

  /// Whether this list tile is in a selected state.
  final bool selected;

  /// The background color of the tile.
  final Color backgroundColor;

  /// The background color when the tile is selected.
  final Color? selectedBackgroundColor;

  /// The color of the borders.
  final Color borderColor;

  /// The width of the bottom and right borders (more pronounced).
  final double primaryBorderWidth;

  /// The width of the top and left borders (less pronounced).
  final double secondaryBorderWidth;

  /// The radius of the tile's corners.
  final double borderRadius;

  /// The padding around the tile's content.
  final EdgeInsets contentPadding;

  /// The elevation of the tile in its default state.
  final double elevation;

  /// The elevation of the tile when hovered over.
  final double hoverElevation;

  /// The duration of transitions between states.
  final Duration animationDuration;

  /// The text style for the title.
  final TextStyle? titleStyle;

  /// The text style for the subtitle.
  final TextStyle? subtitleStyle;

  /// Whether to show a shadow behind the tile.
  final bool showShadow;

  /// The offset of the shadow.
  final Offset shadowOffset;

  /// The color of the shadow. If not specified, uses borderColor with opacity.
  final Color? shadowColor;

  /// Whether this is a dense tile.
  final bool dense;

  /// The width that the primary borders compress to when pressed.
  final double compressedBorderWidth;

  /// The vertical offset when the tile is pressed.
  final double pressedOffset;

  @override
  State<NeuListTile> createState() => _NeuListTileState();
}

class _NeuListTileState extends State<NeuListTile> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isPressed = false;
  late AnimationController _buttonController;
  late Animation<double> _borderAnimation;

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _borderAnimation = Tween<double>(
      begin: widget.primaryBorderWidth,
      end: widget.compressedBorderWidth,
    ).animate(_buttonController);
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _buttonController.forward();
    setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails details) {
    _buttonController.reverse();
    setState(() => _isPressed = false);
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  void _handleTapCancel() {
    _buttonController.reverse();
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final Color effectiveBackgroundColor = widget.selected
        ? widget.selectedBackgroundColor ?? widget.backgroundColor.withValues(alpha: 0.9)
        : widget.backgroundColor;

    final effectiveShadowColor = widget.shadowColor ??
        widget.borderColor.withValues(alpha: 0.5);

    final double effectiveElevation = _isPressed
        ? 0
        : (_isHovered
        ? widget.hoverElevation
        : widget.elevation);

    // Apply theme defaults for text styles
    final ThemeData theme = Theme.of(context);
    final TextStyle effectiveTitleStyle = widget.titleStyle ??
        theme.textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
        );

    final TextStyle effectiveSubtitleStyle = widget.subtitleStyle ??
        theme.textTheme.bodyMedium!;

    return AnimatedBuilder(
      animation: _buttonController,
      builder: (context, child) {
        return GestureDetector(
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTapCancel: _handleTapCancel,
          onLongPress: widget.onLongPress,
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: AnimatedContainer(
              duration: widget.animationDuration,
              transform: Matrix4.translationValues(0, _isPressed ? widget.pressedOffset : 0, 0),
              decoration: BoxDecoration(
                color: effectiveBackgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border(
                  top: BorderSide(color: widget.borderColor, width: widget.secondaryBorderWidth),
                  left: BorderSide(color: widget.borderColor, width: widget.secondaryBorderWidth),
                  right: BorderSide(color: widget.borderColor, width: _borderAnimation.value),
                  bottom: BorderSide(color: widget.borderColor, width: _borderAnimation.value),
                ),
                boxShadow: widget.showShadow && effectiveElevation > 0
                    ? [
                  BoxShadow(
                    color: effectiveShadowColor,
                    offset: widget.shadowOffset * (effectiveElevation / widget.hoverElevation),
                    blurRadius: 0,
                  ),
                ]
                    : null,
              ),
              child: Padding(
                padding: widget.contentPadding,
                child: Row(
                  children: [
                    if (widget.leading != null) ...[
                      widget.leading!,
                      SizedBox(width: 16),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DefaultTextStyle(
                            style: effectiveTitleStyle,
                            child: widget.title,
                          ),
                          if (widget.subtitle != null) ...[
                            SizedBox(height: 4),
                            DefaultTextStyle(
                              style: effectiveSubtitleStyle,
                              child: widget.subtitle!,
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (widget.trailing != null) ...[
                      SizedBox(width: 16),
                      widget.trailing!,
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Example usage:
///
/// ```dart
/// NeuListTile(
///   title: Text('Regular Item'),
///   subtitle: Text('This is a description'),
///   leading: Icon(Icons.star),
///   trailing: Icon(Icons.arrow_forward_ios),
///   onTap: () => print('Tapped item'),
/// )
/// ```