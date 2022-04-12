import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeButton extends StatelessWidget {
  final Color? color;
  final Color? titleColor;
  final double width;
  final double height;
  final String title;
  final String? navigationPath;
  const HomeButton({
    Key? key,
    this.color,
    this.titleColor,
    this.navigationPath,
    required this.width,
    required this.height,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.navigate(navigationPath ?? '/home'),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        width: width,
        height: height,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
