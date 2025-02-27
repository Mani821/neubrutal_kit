import 'package:flutter/material.dart';

/// A custom slider widget with a neubrutalism design style.
///
/// This widget displays a slider with a unique aesthetic featuring bold borders,
/// custom shadows, and a distinct track and thumb design. It supports customization
/// of colors, dimensions, and styling properties.
class NeuSlider extends StatefulWidget {
  /// The current value of the slider.
  final double value;

  /// The minimum value of the slider.
  final double min;

  /// The maximum value of the slider.
  final double max;

  /// Called when the slider value changes.
  final ValueChanged<double> onChanged;

  /// Called when slider interaction starts.
  final ValueChanged<double>? onChangeStart;

  /// Called when slider interaction ends.
  final ValueChanged<double>? onChangeEnd;

  /// Color for the active portion of the track.
  final Color activeTrackColor;

  /// Color for the inactive portion of the track.
  final Color inactiveTrackColor;

  /// Color for the slider thumb.
  final Color thumbColor;

  /// Border color used for both the thumb and the track.
  final Color borderColor;

  /// Width of the border for both the thumb and the track.
  final double borderWidth;

  /// Radius of the slider thumb.
  final double thumbRadius;

  /// Height of the slider track.
  final double trackHeight;

  /// Border radius of the slider track.
  final double borderRadius;

  /// Offset for the shadow effect.
  final Offset shadowOffset;

  /// Color of the shadow.
  final Color shadowColor;

  /// Creates a neubrutalism slider.
  const NeuSlider({
    super.key,
    required this.value,
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
  _NeuSliderState createState() => _NeuSliderState();
}

class _NeuSliderState extends State<NeuSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        // Use the provided colors and dimensions.
        activeTrackColor: widget.activeTrackColor,
        inactiveTrackColor: widget.inactiveTrackColor,
        trackHeight: widget.trackHeight,
        // Use our custom track shape that respects borderWidth, borderRadius, etc.
        trackShape: _NeuSliderTrackShape(
          borderWidth: widget.borderWidth,
          borderColor: widget.borderColor,
          trackHeight: widget.trackHeight,
          borderRadius: widget.borderRadius,
          shadowOffset: widget.shadowOffset,
          shadowColor: widget.shadowColor,
        ),
        // Use our custom thumb shape that respects thumbRadius, borderWidth, etc.
        thumbShape: _NeuSliderThumbShape(
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
      child: Slider(
        value: widget.value,
        min: widget.min,
        max: widget.max,
        onChanged: widget.onChanged,
        onChangeStart: widget.onChangeStart,
        onChangeEnd: widget.onChangeEnd,
      ),
    );
  }
}

/// Custom slider thumb shape with neubrutalism design.
class _NeuSliderThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final Color thumbColor;
  final Color borderColor;
  final double borderWidth;
  final Offset shadowOffset;
  final Color shadowColor;

  const _NeuSliderThumbShape({
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
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required Size sizeWithOverflow,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double textScaleFactor,
        required double value,
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

/// Custom slider track shape with neubrutalism design.
class _NeuSliderTrackShape extends SliderTrackShape {
  final double borderWidth;
  final Color borderColor;
  final double trackHeight;
  final double borderRadius;
  final Offset shadowOffset;
  final Color shadowColor;

  const _NeuSliderTrackShape({
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
        bool isDiscrete = false,
        bool isEnabled = true,
        required TextDirection textDirection,
        required Offset thumbCenter,
        Offset? secondaryOffset,
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
    final Paint trackPaint = Paint()
      ..color = sliderTheme.inactiveTrackColor ?? Colors.grey
      ..style = PaintingStyle.fill;
    canvas.drawRRect(trackRRect, trackPaint);

    // Draw the track border using the custom borderWidth and borderColor.
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;
    canvas.drawRRect(trackRRect, borderPaint);
  }
}
