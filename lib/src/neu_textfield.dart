import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// A TextField widget with a neubrutal design style.
///
/// This widget provides a customizable text input field with neubrutal design elements
/// including bold borders, custom shadows, and interactive feedback.
class NeuTextField extends StatefulWidget {
  /// Controller for the text field.
  final TextEditingController controller;

  /// Hint text displayed when the field is empty.
  final String hint;

  /// Label text displayed above the text field.
  final String? label;

  /// Maximum number of lines for the text field.
  final int? maxLines;

  /// Minimum number of lines for the text field.
  final int? minLines;

  /// Keyboard type for the text field.
  final TextInputType? keyboardType;

  /// Whether the text field is enabled.
  final bool enabled;

  /// Callback when the text field is tapped.
  final VoidCallback? onTap;

  /// Whether the text field is read-only.
  final bool readOnly;

  /// Callback when the suffix icon is tapped.
  final Function(bool)? onSuffixTap;

  /// Path to the prefix icon.
  final String? prefixIcon;

  /// Widget to use as prefix icon (prioritized over prefixIcon string).
  final Widget? prefixIconWidget;

  /// Widget to use as suffix icon.
  final Widget? suffixIcon;

  /// Whether the text is obscured.
  final bool obscureText;

  /// Whether this is a password field.
  final bool isPasswordField;

  /// Callback when the text changes.
  final bool? Function(String)? onChanged;

  /// Callback that returns the new text value.
  final void Function(String)? onChangedText;

  /// Text capitalization for the text field.
  final TextCapitalization capitalization;

  /// Input formatters for the text field.
  final List<TextInputFormatter>? inputFormatters;

  /// Focus node for the text field.
  final FocusNode? focusNode;

  /// Text input action for the text field.
  final TextInputAction? textInputAction;

  /// Callback when the field is submitted.
  final ValueChanged<String>? onFieldSubmitted;

  /// Validator for the text field.
  final String? Function(String?)? validator;

  /// Border radius for the text field.
  final BorderRadius? borderRadius;

  /// Border color for the text field.
  final Color borderColor;

  /// Border width for the text field.
  final double borderWidth;

  /// Shadow offset for the neubrutal effect.
  final Offset shadowOffset;

  /// Shadow color for the neubrutal effect.
  final Color shadowColor;

  /// Background color of the text field.
  final Color backgroundColor;

  /// Text style for the input.
  final TextStyle? textStyle;

  /// Hint text style.
  final TextStyle? hintStyle;

  /// Label text style.
  final TextStyle? labelStyle;

  /// Error text style.
  final TextStyle? errorStyle;

  /// Cursor color.
  final Color? cursorColor;

  /// Cursor height.
  final double? cursorHeight;

  /// Padding for the text field.
  final EdgeInsetsGeometry contentPadding;

  /// Whether to show clear button when text is not empty.
  final bool showClearButton;

  /// Custom clear button icon.
  final Widget? clearButtonIcon;

  /// Whether the error text should animate.
  final bool animateError;

  /// Duration of the error text animation.
  final Duration errorAnimationDuration;

  /// Curve of the error text animation.
  final Curve errorAnimationCurve;

  /// Creates a neubrutal style text field.
  const NeuTextField({
    super.key,
    required this.controller,
    this.hint = "Enter text",
    this.label,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType,
    this.enabled = true,
    this.onTap,
    this.readOnly = false,
    this.onSuffixTap,
    this.prefixIcon,
    this.prefixIconWidget,
    this.suffixIcon,
    this.obscureText = false,
    this.isPasswordField = false,
    this.onChanged,
    this.onChangedText,
    this.capitalization = TextCapitalization.none,
    this.inputFormatters,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.validator,
    this.borderRadius,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
    this.shadowOffset = const Offset(3, 3),
    this.shadowColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.cursorColor,
    this.cursorHeight,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 15,
    ),
    this.showClearButton = true,
    this.clearButtonIcon,
    this.animateError = true,
    this.errorAnimationDuration = const Duration(seconds: 2),
    this.errorAnimationCurve = Curves.elasticOut,
  });

  @override
  State<NeuTextField> createState() => _NeuTextFieldState();
}

class _NeuTextFieldState extends State<NeuTextField> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(_handleFocusChange);

    widget.controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.removeListener(_handleFocusChange);
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = BorderRadius.circular(12);

    // Wrap everything in a FormField to manage validation.
    return FormField<String>(
      // Use the controller's current text as the initial value.
      initialValue: widget.controller.text,
      // Use the validator provided by the user.
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (FormFieldState<String> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: widget.borderRadius ?? defaultBorderRadius,
                border: Border(
                  bottom: BorderSide(
                    color: widget.borderColor,
                    width: widget.borderWidth,
                  ),
                  right: BorderSide(
                    color: widget.borderColor,
                    width: widget.borderWidth,
                  ),
                  left: BorderSide(
                    color: widget.borderColor,
                    width: widget.borderWidth * 0.8,
                  ),
                  top: BorderSide(
                    color: widget.borderColor,
                    width: widget.borderWidth * 0.8,
                  ),
                ),
                boxShadow:
                _isFocused
                    ? [
                  BoxShadow(
                    color: widget.shadowColor,
                    offset: widget.shadowOffset,
                    blurRadius: 0,
                  ),
                ]
                    : null,
              ),
              child: TextFormField(
                controller: widget.controller,
                // Remove the validator here since the FormField above handles it.
                validator: null,
                onChanged: (value) {
                  // Update the FormField state.
                  field.didChange(value);

                  // Also trigger any callbacks provided.
                  if (widget.onChanged != null) {
                    widget.onChanged!(value);
                  }
                  if (widget.onChangedText != null) {
                    widget.onChangedText!(value);
                  }
                  setState(() {});
                },
                focusNode: _focusNode,
                textInputAction: widget.textInputAction,
                style:
                widget.textStyle ??
                    const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Averia',
                      height: 1.0,
                      fontWeight: FontWeight.w600,
                    ),
                decoration: InputDecoration(
                  isCollapsed: true,
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: widget.contentPadding,
                  suffixIcon: _buildSuffixIcon(),
                  prefixIcon: _buildPrefixIcon(),
                  hintText: widget.hint,
                  hintStyle:
                  widget.hintStyle ??
                      const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Averia',
                        fontSize: 12,
                      ),
                  // Set errorText to null so the error is not shown inside the container.
                  errorText: null,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                onFieldSubmitted: widget.onFieldSubmitted,
                keyboardType: widget.keyboardType,
                maxLines: widget.maxLines,
                textCapitalization: widget.capitalization,
                cursorColor: widget.cursorColor ?? Colors.black,
                cursorHeight: widget.cursorHeight ?? 16,
                obscureText: _obscureText,
                enabled: widget.enabled,
                readOnly: widget.readOnly,
                minLines: widget.minLines,
              ),
            ),
            // Display the error message outside the container if present.
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 8),
                child:
                widget.animateError
                    ? Text(
                  field.errorText ?? '',
                  style:
                  widget.errorStyle ??
                      const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontFamily: 'Averia',
                      ),
                ).animate().scale(
                  alignment: Alignment.centerLeft,
                  duration: widget.errorAnimationDuration,
                  curve: widget.errorAnimationCurve,
                )
                    : Text(
                  field.errorText ?? '',
                  style:
                  widget.errorStyle ??
                      const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontFamily: 'Averia',
                      ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget? _buildSuffixIcon() {
    if (!widget.enabled) {
      return null;
    }

    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }

    if (widget.isPasswordField) {
      return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
          if (widget.onSuffixTap != null) {
            widget.onSuffixTap!(_obscureText);
          }
        },
        icon: Icon(
          _obscureText
              ? Icons.visibility_off_rounded
              : Icons.visibility_rounded,
          color: Colors.grey[500],
          size: 19,
        ),
      );
    }

    if (widget.showClearButton && widget.controller.text.isNotEmpty) {
      return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          widget.controller.clear();
          if (widget.onChangedText != null) {
            widget.onChangedText!('');
          }
        },
        icon:
        widget.clearButtonIcon ??
            Image.asset(
              'packages/neubrutal_kit/assets/icons/close.png',
              height: 25,
              width: 25,
              color: Colors.grey[800],
            ),
      );
    }

    return null;
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefixIconWidget != null) {
      return widget.prefixIconWidget;
    }

    if (widget.prefixIcon != null) {
      return Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 14) +
            const EdgeInsets.only(left: 8, right: 6),
        child: Image.asset(
          widget.prefixIcon!,
          height: 16,
          width: 16,
          color:
          widget.controller.text.isNotEmpty
              ? widget.borderColor
              : Colors.grey,
        ),
      );
    }

    return null;
  }
}
