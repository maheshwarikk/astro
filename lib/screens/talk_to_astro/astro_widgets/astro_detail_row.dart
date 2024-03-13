part of 'astro_widgets.dart';

class AstroDetailRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle? textStyle;
  const AstroDetailRow({
    Key? key,
    required this.icon,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.orange,
          size: 14,
        ),
        Flexible(
          child: Text(
            text,
            style: textStyle ??
                const TextStyle(
                  fontSize: 12,
                ),
          ).px12(),
        ),
      ],
    ).py4();
  }
}
