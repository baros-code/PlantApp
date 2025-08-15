import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
    super.key,
  });
  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class GradientTextSpan extends StatelessWidget {
  const GradientTextSpan({
    super.key,
    required this.children,
    required this.gradient,
    this.style,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
  });

  /// Root style applied to all spans unless overridden by a child's style.
  final TextStyle? style;

  /// Gradient to apply across the entire composed text bounds.
  final Gradient gradient;

  /// Inline spans similar to [TextSpan.children]. You can mix [TextSpan] and [WidgetSpan].
  final List<InlineSpan> children;

  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: RichText(
        text: TextSpan(style: style, children: children),
        textAlign: textAlign,
        textDirection: textDirection,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
      ),
    );
  }
}
