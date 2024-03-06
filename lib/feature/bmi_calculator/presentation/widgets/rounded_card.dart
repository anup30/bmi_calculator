import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final Color color;
  final Widget child;

  const RoundedCard({
    Key? key,
    required this.color,
    required this.child,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}