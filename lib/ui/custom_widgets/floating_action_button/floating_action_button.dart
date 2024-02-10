import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  const FAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      shape: CircleBorder(),
      elevation: 100,
      child: Icon(
        Icons.add,
        size: 35,
      ),
    );
  }
}
