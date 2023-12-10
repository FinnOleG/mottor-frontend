// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../create_new_template/create_new_template_widget.dart';
export '../../create_new_template/create_new_template_widget.dart';

class ImageFrameSelector extends StatefulWidget {
  const ImageFrameSelector({
    Key? key,
    this.width,
    this.height,
    this.imagePath,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? imagePath;

  @override
  _ImageFrameSelectorState createState() => _ImageFrameSelectorState();
}

class _ImageFrameSelectorState extends State<ImageFrameSelector> {
  Offset _startPosition = Offset.zero;
  Rect _selectionRect = Rect.zero;

  late CreateNewTemplateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateNewTemplateModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        setState(() {
          _startPosition = _constrainPoint(details.localPosition);
          _selectionRect = Rect.fromPoints(_startPosition, _startPosition);
        });
      },
      onPanUpdate: (details) {
        setState(() {
          final endPosition = _constrainPoint(details.localPosition);
          _selectionRect = Rect.fromPoints(_startPosition, endPosition);
        });
      },
      onPanEnd: (details) async {
        await saveSelection();
      },
      child: Stack(
        children: [
          Container(
            width: widget.width ?? 300,
            height: widget.height ?? 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: widget.imagePath != null
                ? Image.network(widget.imagePath!, fit: BoxFit.contain)
                : null,
          ),
          Positioned(
            left: 0,
            top: 0,
            width: widget.width ?? 300,
            height: widget.height ?? 300,
            child: CustomPaint(
              painter: SelectionPainter(selectionRect: _selectionRect),
            ),
          ),
        ],
      ),
    );
  }

  Offset _constrainPoint(Offset point) {
    final double x = point.dx.clamp(0, widget.width ?? 300);
    final double y = point.dy.clamp(0, widget.height ?? 300);
    return Offset(x, y);
  }

  Future<void> saveSelection() async {
    final selectionData = {
      "x": _selectionRect.left.toString(),
      "y": _selectionRect.top.toString(),
      "width": _selectionRect.width.toString(),
      "height": _selectionRect.height.toString(),
    };

    final selectionDataString = jsonEncode(selectionData);

    setState(() {
      _model.rectSelection = selectionDataString;
      FFAppState().rectSelection = selectionDataString;
    });
    // FFAppState().update(() {});
  }
}

class SelectionPainter extends CustomPainter {
  final Rect selectionRect;

  SelectionPainter({required this.selectionRect});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    canvas.drawRect(selectionRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
