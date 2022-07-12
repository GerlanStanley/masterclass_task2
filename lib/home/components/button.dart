import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget child;
  final Function() onPressed;

  const Button({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return Colors.white;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return Colors.blue;
          },
        ),
        padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
          (Set<MaterialState> states) {
            return const EdgeInsets.symmetric(vertical: 12);
          },
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (Set<MaterialState> states) {
            return const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            );
          },
        ),
      ),
      child: child,
    );
  }
}
