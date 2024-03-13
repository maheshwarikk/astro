import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final bool? enabled;
  final Widget? child;
  final double? borderRadius;
  final double? width;
  final EdgeInsets? margin;
  final double? height;
  final Color? color;
  final Color? textColor;
  const PrimaryButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.enabled,
    this.child,
    this.borderRadius,
    this.width,
    this.margin,
    this.height,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var enabledStyle = ElevatedButton.styleFrom(
      // primary: color ?? Theme.of(context).primaryColor,
      // onPrimary: textColor ?? Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 6),
      ),
    );
    return ElevatedButton(
      onPressed: onPressed,
      style: enabledStyle,
      child: text != null
          ? FittedBox(
              fit: BoxFit.fitHeight,
              child: Center(
                child: Text(
                  text!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : child,
    );
  }
}
