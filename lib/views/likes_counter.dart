import 'package:flutter/material.dart';

class LikesCounter extends StatefulWidget {
  const LikesCounter({super.key, required this.likes});

  final int likes;

  @override
  State<LikesCounter> createState() => _LikesCounterState();
}

class _LikesCounterState extends State<LikesCounter> {
  late int _likes;

  @override
  void initState() {
    super.initState();
    _likes = widget.likes;
  }

  void _incrementLikes() {
    setState(() {
      _likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(
            Icons.favorite,
            color: Color.fromARGB(255, 187, 34, 24),
          ),
          onPressed: _incrementLikes,
        ),
        Text('$_likes'),
      ],
    );
  }
}
