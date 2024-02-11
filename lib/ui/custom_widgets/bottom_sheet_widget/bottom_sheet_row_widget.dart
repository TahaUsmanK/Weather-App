import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class BottomSheetRowWidget extends StatefulWidget {
  final EdgeInsets? margin;

  const BottomSheetRowWidget({Key? key, this.margin}) : super(key: key);

  @override
  State<BottomSheetRowWidget> createState() => _BottomSheetRowWidgetState();
}

class _BottomSheetRowWidgetState extends State<BottomSheetRowWidget> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        dragStartBehavior: DragStartBehavior.start,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Replace this GlassContainer with real API data widgets
            GlassContainer(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.15,
              borderRadius: BorderRadius.circular(30),
              blur: 7,
              borderColor: Colors.transparent,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF262C51).withAlpha(100),
                  Color(0xFFffffff).withAlpha(0),
                  Color(0xff612FAB).withAlpha(50),
                ],
                stops: [0.3, 0.7, 1],
              ),
              borderGradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Color(0xFF262C51).withAlpha(100),
                  Color(0xFFffffff).withAlpha(0),
                  Color(0xff612FAB).withAlpha(50),
                ],
                stops: [0.3, 0.7, 1],
              ),
              child: Center(
                child: Text(
                  "Replace with real API data",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            // Replace this SizedBox with other widgets displaying real API data
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet Demo'),
      ),
      body: BottomSheetRowWidget(),
    ),
  ));
}
