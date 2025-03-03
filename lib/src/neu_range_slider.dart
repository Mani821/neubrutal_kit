import 'package:flutter/material.dart';

/// A custom range slider widget with a neubrutalism design style.
///
/// This widget displays a range slider with a unique aesthetic featuring bold borders,
/// custom shadows, and a distinct track and thumb design. It supports customization
/// of colors, dimensions, and styling properties.
class NeuRangeSlider extends StatefulWidget {
  /// The current range values of the slider.
  final RangeValues values;

  /// The minimum value of the slider.
  final double min;

  /// The maximum value of the slider.
  final double max;

  /// Called when the slider values change.
  final ValueChanged<RangeValues> onChanged;

  /// Called when slider interaction starts.
  final ValueChanged<RangeValues>? onChangeStart;

  /// Called when slider interaction ends.
  final ValueChanged<RangeValues>? onChangeEnd;

  /// Color for the active portion of the track.
  final Color activeTrackColor;

  /// Color for the inactive portion of the track.
  final Color inactiveTrackColor;

  /// Color for the slider thumbs.
  final Color thumbColor;

  /// Border color used for both the thumbs and the track.
  final Color borderColor;

  /// Width of the border for both the thumbs and the track.
  final double borderWidth;

  /// Radius of the slider thumbs.
  final double thumbRadius;

  /// Height of the slider track.
  final double trackHeight;

  /// Border radius of the slider track.
  final double borderRadius;

  /// Offset for the shadow effect.
  final Offset shadowOffset;

  /// Color of the shadow.
  final Color shadowColor;

  /// Creates a neubrutalism range slider.
  const NeuRangeSlider({
    super.key,
    required this.values,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.onChangeStart,
    this.onChangeEnd,
    this.activeTrackColor = Colors.blue,
    this.inactiveTrackColor = Colors.grey,
    this.thumbColor = Colors.white,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
    this.thumbRadius = 10.0,
    this.trackHeight = 4.0,
    this.borderRadius = 8.0,
    this.shadowOffset = const Offset(3, 3),
    this.shadowColor = Colors.black,
  });

  @override
  NeuRangeSliderState createState() => NeuRangeSliderState();
}

class NeuRangeSliderState extends State<NeuRangeSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        // Use the provided colors and dimensions.
        activeTrackColor: widget.activeTrackColor,
        inactiveTrackColor: widget.inactiveTrackColor,
        trackHeight: widget.trackHeight,
        // Use our custom range track shape that respects borderWidth, borderRadius, etc.
        rangeTrackShape: _NeuRangeSliderTrackShape(
          borderWidth: widget.borderWidth,
          borderColor: widget.borderColor,
          trackHeight: widget.trackHeight,
          borderRadius: widget.borderRadius,
          shadowOffset: widget.shadowOffset,
          shadowColor: widget.shadowColor,
        ),
        // Use our custom range thumb shape that respects thumbRadius, borderWidth, etc.
        rangeThumbShape: _NeuRangeSliderThumbShape(
          thumbRadius: widget.thumbRadius,
          thumbColor: widget.thumbColor,
          borderColor: widget.borderColor,
          borderWidth: widget.borderWidth,
          shadowOffset: widget.shadowOffset,
          shadowColor: widget.shadowColor,
        ),
        // Disable overlay to keep the design clean.
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: RangeSlider(
        values: widget.values,
        min: widget.min,
        max: widget.max,
        onChanged: widget.onChanged,
        onChangeStart: widget.onChangeStart,
        onChangeEnd: widget.onChangeEnd,
      ),
    );
  }
}

/// Custom range slider thumb shape with neubrutalism design.
class _NeuRangeSliderThumbShape extends RangeSliderThumbShape {
  final double thumbRadius;
  final Color thumbColor;
  final Color borderColor;
  final double borderWidth;
  final Offset shadowOffset;
  final Color shadowColor;

  const _NeuRangeSliderThumbShape({
    required this.thumbRadius,
    required this.thumbColor,
    required this.borderColor,
    this.borderWidth = 2.0,
    this.shadowOffset = const Offset(3, 3),
    this.shadowColor = Colors.black,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      Size.fromRadius(thumbRadius);

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        bool isDiscrete = false,
        bool isEnabled = true,
        bool isOnTop = false,
        bool isPressed = false,
        required SliderThemeData sliderTheme,
        TextDirection? textDirection,
        Thumb? thumb,
        bool? isStart,
      }) {
    final Canvas canvas = context.canvas;

    // Draw the thumb shadow.
    final Path shadowPath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: thumbRadius));
    canvas.drawShadow(shadowPath, shadowColor, shadowOffset.distance, true);

    // Draw the thumb circle.
    final Paint thumbPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, thumbRadius, thumbPaint);

    // Draw the border around the thumb.
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}

/// Custom range slider track shape with neubrutalism design.
class _NeuRangeSliderTrackShape extends RangeSliderTrackShape {
  final double borderWidth;
  final Color borderColor;
  final double trackHeight;
  final double borderRadius;
  final Offset shadowOffset;
  final Color shadowColor;

  const _NeuRangeSliderTrackShape({
    required this.borderWidth,
    required this.borderColor,
    required this.trackHeight,
    required this.borderRadius,
    required this.shadowOffset,
    required this.shadowColor,
  });

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = true,
    bool isDiscrete = false,
  }) {
    // Use the trackHeight provided.
    final double height = trackHeight;
    final double left = offset.dx;
    final double top = offset.dy + (parentBox.size.height - height) / 2;
    final double width = parentBox.size.width;
    return Rect.fromLTWH(left, top, width, height);
  }

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required Offset startThumbCenter,
        required Offset endThumbCenter,
        bool isEnabled = true,
        bool isDiscrete = false,
        required TextDirection textDirection,
        double additionalActiveTrackHeight = 0,
      }) {
    final Canvas canvas = context.canvas;
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    // Create a rounded rectangle for the track using the provided borderRadius.
    final RRect trackRRect =
    RRect.fromRectAndRadius(trackRect, Radius.circular(borderRadius));

    // Draw the inactive track background using the theme color.
    final Paint inactiveTrackPaint = Paint()
      ..color = sliderTheme.inactiveTrackColor ?? Colors.grey
      ..style = PaintingStyle.fill;
    canvas.drawRRect(trackRRect, inactiveTrackPaint);

    // Calculate the active track portion
    final double startPos = startThumbCenter.dx;
    final double endPos = endThumbCenter.dx;

    // Draw the active track portion
    final Rect activeRect = Rect.fromLTRB(
      startPos,
      trackRect.top,
      endPos,
      trackRect.bottom,
    );

    if (activeRect.width > 0) {
      final RRect activeRRect = RRect.fromRectAndRadius(
        activeRect,
        Radius.circular(borderRadius),
      );

      final Paint activeTrackPaint = Paint()
        ..color = sliderTheme.activeTrackColor ?? Colors.blue
        ..style = PaintingStyle.fill;
      canvas.drawRRect(activeRRect, activeTrackPaint);
    }

    // Draw the track border using the custom borderWidth and borderColor.
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;
    canvas.drawRRect(trackRRect, borderPaint);
  }
}
