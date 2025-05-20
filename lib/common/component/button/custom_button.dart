import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.children,
    required this.onPressed,
    required this.isDeactivated,
    required this.height,
    required this.width,
    required this.color,
    super.key,
  });

  final List<Widget> children;
  final void Function() onPressed;
  final bool isDeactivated;
  final double? height;
  final double? width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDeactivated ? () {} : onPressed,
      child: Container(
        height: height ?? 48,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isDeactivated == true ? color.withAlpha(127) : color,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
