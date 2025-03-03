import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A custom segmented control widget with animated selection and PageView integration.
///
/// This widget displays a segmented control with an animated selection indicator.
/// When used in combination with a [PageView] (by providing a [pageController]),
/// tapping on a segment changes the page, and swiping the page updates the selected segment.
class NeuSegmentControl extends StatefulWidget {
  /// List of segment labels.
  final List<String> segments;

  /// Callback when a segment is selected. The index of the selected segment is provided.
  final void Function(int) onSegmentSelected;

  /// The initially selected segment index.
  final int initialIndex;

  /// An optional [PageController] for synchronizing with a [PageView].
  ///
  /// When provided, tapping a segment animates to the corresponding page,
  /// and swiping the [PageView] updates the selected segment.
  final PageController? pageController;

  /// Background color of the control.
  final Color backgroundColor;

  /// Color of the selected segment indicator.
  final Color selectedColor;

  /// Border color of the control.
  final Color borderColor;

  /// Height of the control.
  final double height;

  /// Border radius of the control.
  final double borderRadius;

  /// Text style for the selected segment label.
  final TextStyle? selectedTextStyle;

  /// Text style for the unselected segment labels.
  final TextStyle? unselectedTextStyle;

  /// Duration of the selection animation.
  final Duration animationDuration;


  /// Curve of the selection animation.
  final Curve animationCurve;

  /// Duration for text animation
  final Duration textAnimationDuration;

  /// Curve of the selected text animation.
  final Curve textAnimationCurve;

  /// Creates a custom segmented control.
  ///
  /// The [segments] list must contain at least 2 items.
  const NeuSegmentControl({
    super.key,
    required this.segments,
    required this.onSegmentSelected,
    this.initialIndex = 0,
    this.pageController,
    this.backgroundColor = Colors.transparent,
    this.selectedColor = Colors.black12,
    this.borderColor = Colors.black,
    this.height = 50,
    this.borderRadius = 12,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.animationDuration = const Duration(milliseconds: 400),
    this.textAnimationDuration = const Duration(milliseconds: 100),
    this.animationCurve = Curves.easeInOutQuint,
    this.textAnimationCurve = Curves.easeInOutQuint,
  }) : assert(segments.length >= 2, 'Must have at least 2 segments');

  @override
  State<NeuSegmentControl> createState() => _NeuSegmentControlState();
}

class _NeuSegmentControlState extends State<NeuSegmentControl> {
  /// The currently selected segment index.
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;

    // If a PageController is provided, listen for page changes
    // so that swiping in the PageView updates the selected segment.
    widget.pageController?.addListener(_pageListener);
  }

  /// Listens to the PageController and updates the selected segment based on the page.
  void _pageListener() {
    final page = widget.pageController!.page;
    if (page != null && page.round() != currentIndex) {
      setState(() {
        currentIndex = page.round();
      });
    }
  }

  @override
  void didUpdateWidget(covariant NeuSegmentControl oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the PageController instance changes, update the listener.
    if (oldWidget.pageController != widget.pageController) {
      oldWidget.pageController?.removeListener(_pageListener);
      widget.pageController?.addListener(_pageListener);
    }
  }

  @override
  void dispose() {
    // Remove the listener from the PageController if provided.
    widget.pageController?.removeListener(_pageListener);
    super.dispose();
  }

  /// Get the appropriate TextStyle based on whether the segment is selected
  TextStyle _getTextStyleForSegment(int index) {
    final defaultSelectedStyle = const TextStyle(
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      fontFamily: 'Averia',
      color: Colors.black,
    );

    final defaultUnselectedStyle = const TextStyle(
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      fontFamily: 'Averia',
      color: Colors.black54,
    );

    if (index == currentIndex) {
      return widget.selectedTextStyle ?? defaultSelectedStyle;
    } else {
      return widget.unselectedTextStyle ?? defaultUnselectedStyle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 140.ms,
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.backgroundColor,
        border: Border(
          bottom: BorderSide(color: widget.borderColor, width: 6),
          top: BorderSide(color: widget.borderColor, width: 2),
          left: BorderSide(color: widget.borderColor, width: 2),
          right: BorderSide(color: widget.borderColor, width: 6),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Animated selection indicator that moves based on [currentIndex].
          AnimatedAlign(
            duration: widget.animationDuration,
            curve: widget.animationCurve,
            alignment: Alignment(
              -1 + (2 * currentIndex / (widget.segments.length - 1)),
              0,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return AnimatedContainer(
                  duration: 140.ms,
                  height: widget.height + 6,
                  width: constraints.maxWidth / widget.segments.length,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(widget.borderRadius / 2),
                    color: widget.selectedColor,
                    border: Border(
                      top: BorderSide(color: widget.borderColor, width: 1.6),
                      left: BorderSide(color: widget.borderColor, width: 2),
                      right: BorderSide(color: widget.borderColor, width: 2),
                      bottom: BorderSide(color: widget.borderColor, width: 1.6),
                    ),
                  ),
                );
              },
            ),
          ),
          // Row of segments.
          Row(
            children: List.generate(widget.segments.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Update the selected segment and notify the callback.
                    setState(() {
                      currentIndex = index;
                    });
                    widget.onSegmentSelected(index);
                    // If a PageController is provided, animate to the corresponding page.
                    widget.pageController?.animateToPage(
                      index,
                      duration: widget.animationDuration,
                      curve: widget.animationCurve,
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        style: _getTextStyleForSegment(index),
                        duration: widget.textAnimationDuration,
                        curve: widget.textAnimationCurve,
                        child: Text(
                          widget.segments[index],
                          textAlign: TextAlign.center,
                         
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}