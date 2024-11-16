import 'package:flutter/material.dart';

class Skill extends StatelessWidget {
  const Skill({super.key, required this.skill});

  final String skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 12,
        ),
      ),
    );
  }
}
