import 'dart:ui';
import 'package:flutter/material.dart';

class DraggableBottomSheet extends StatefulWidget {
  final Widget? backgroundWidget;
  final Widget previewChild;
  final Widget expandedChild;
  final Alignment alignment;
  final bool blurBackground;
  final double expansionExtent;
  final double maxExtent;
  final double minExtent;
  final Axis scrollDirection;

  const DraggableBottomSheet({
    Key? key,
    this.backgroundWidget,
    required this.previewChild,
    required this.expandedChild,
    this.alignment = Alignment.bottomLeft,
    this.blurBackground = false,
    this.expansionExtent = 10,
    this.maxExtent = double.infinity,
    this.minExtent = 10,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  @override
  _DraggableBottomSheetState createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  late double currentHeight;
  double? newHeight;

  @override
  void initState() {
    currentHeight = widget.minExtent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (widget.blurBackground && currentHeight > widget.minExtent)
          Positioned.fill(
            child: GestureDetector(
              onTap: () => setState(() => currentHeight = widget.minExtent),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),
        Align(
          alignment: widget.alignment,
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (widget.scrollDirection == Axis.horizontal) return;
              newHeight = currentHeight - details.delta.dy;
              _updateHeight();
            },
            onHorizontalDragUpdate: (details) {
              if (widget.scrollDirection == Axis.vertical) return;
              newHeight = currentHeight + details.delta.dx;
              _updateHeight();
            },
            child: SizedBox(
              width: widget.scrollDirection == Axis.vertical
                  ? double.infinity
                  : currentHeight,
              height: widget.scrollDirection == Axis.horizontal
                  ? double.infinity
                  : currentHeight,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: widget.scrollDirection == Axis.vertical
                      ? double.infinity
                      : currentHeight,
                  maxHeight: widget.scrollDirection == Axis.horizontal
                      ? double.infinity
                      : currentHeight,
                ),
                child:
                    (currentHeight - widget.minExtent < widget.expansionExtent)
                        ? widget.previewChild
                        : widget.expandedChild,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _updateHeight() {
    if (newHeight! > widget.minExtent && newHeight! < widget.maxExtent) {
      setState(() => currentHeight = newHeight!);
    }
  }
}
