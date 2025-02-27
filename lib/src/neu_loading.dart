import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A neubrutalism-inspired loading indicator widget.
///
/// This widget displays a loading message with a bold, neumorphic style.
/// The text fades in and out continuously, creating an animated loading effect.
/// Customize the colors, border, shadow, and animation properties as needed.
class NeuLoading extends StatefulWidget {
  const NeuLoading({super.key});

  @override
  State<NeuLoading> createState() => _NeuLoadingState();
}

class _NeuLoadingState extends State<NeuLoading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // Center the loading indicator in its parent.
      child: Container(
        // Container styled with neubrutalism design elements.
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            6,
          ), // Slight rounding for a subtle effect.
          border: Border.all(
            color: Colors.black,
            width: 2,
          ), // Bold black border.
          boxShadow: [
            // Custom shadow to enhance the 3D neubrutal look.
            BoxShadow(offset: Offset(4, 4), color: Colors.black),
          ],
        ),
        // Padding around the text.
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Text(
          "LOADING",
          style: const TextStyle(
            fontFamily: 'Averia', // Custom font family.
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        )
        // Animate the text using flutter_animate.
        // The animation repeats in reverse mode to create a continuous fade effect.
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
        // Fade effect starting from 40% opacity over 600 milliseconds.
            .fade(begin: 0.4, duration: 600.ms),
      ),
    );
  }
}
