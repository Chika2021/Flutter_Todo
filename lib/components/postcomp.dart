import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  final String child;

  const PostComponent({super.key,  required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child:
            Container(height: 100, color: Colors.blueAccent, child: Text(child)),
      ),
    );
  }
}
