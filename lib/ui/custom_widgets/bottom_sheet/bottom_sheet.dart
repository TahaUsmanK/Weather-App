import 'package:flutter/material.dart';

class DraggebleBottomSheet extends StatefulWidget {
  const DraggebleBottomSheet({super.key});

  @override
  State<DraggebleBottomSheet> createState() => _DraggebleBottomSheetState();
}

class _DraggebleBottomSheetState extends State<DraggebleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.40,
      minChildSize: 0.40,
      maxChildSize: 0.82,
      builder: (context, controller) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Color.fromARGB(166, 46, 51, 90),
        ),
        child: Column(children: []),
      ),
    );
  }
}
