import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:frenzi/common/theme/theme.dart';

class FrenziAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FrenziAppBar({this.onBackButtonPressed, super.key});

  final void Function()? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 234, 70, 143),
              Color.fromARGB(255, 237, 120, 67),
            ],
          ),
        ),
      ),
      leading: Row(
        children: [
          const SizedBox(width: 30),
          _BackButton(onBackButtonPressed: onBackButtonPressed),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onBackButtonPressed});

  final void Function()? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onBackButtonPressed ?? () => Beamer.of(context).beamBack(),
      child: Icon(Icons.arrow_back_ios, color: textWhite, size: 20),
    );
  }
}
