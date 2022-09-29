import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const CustomBotton({
    super.key,
    required this.title,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 2, 129, 220),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 100,
        height: 40,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
