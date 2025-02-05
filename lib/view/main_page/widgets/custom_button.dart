import 'package:flutter/material.dart';

class CustomButtonMini extends StatefulWidget {
  final String title;
  final Color color;
  final Future<void> Function() func;
  final double height;
  final double width;

  const CustomButtonMini({
    required this.title,
    required this.color,
    required this.func,
    required this.height,
    required this.width,
    super.key,
  });

  @override
  CustomButtonMiniState createState() => CustomButtonMiniState();
}

class CustomButtonMiniState extends State<CustomButtonMini> {
  bool _isLoading = false;

  Future<void> _handleTap() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await widget.func();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isLoading ? null : _handleTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: _isLoading
              ? Transform.scale(
                  scale: 0.7,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ),
                )
              : Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700
                  ),
                ),
        ),
      ),
    );
  }
}
