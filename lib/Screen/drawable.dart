import 'package:drawable/drawable.dart';
import 'package:flutter/material.dart';

// @dart=2.9

class ColorDrawableWidget extends StatefulWidget {
  @override
  _ColorDrawableWidgetState createState() => _ColorDrawableWidgetState();
}

class _ColorDrawableWidgetState extends State<ColorDrawableWidget> {
  Color _color = Colors.transparent;

  @override
  void initState() {
    super.initState();
    loadColor();
  }

  Future<void> loadColor() async {
    final colorDrawable =
        await const AndroidDrawable().loadColor(name: 'example_color');
    setState(() {
      _color = colorDrawable?.color ?? Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _color,
      width: 50,
      height: 50,
    );
  }
}
