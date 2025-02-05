import 'package:flutter/material.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';

class CustomButtonBlueLine extends StatefulWidget {
  final String title;
  final Future<void> Function() func;
  final double height;
  final double width;

  const CustomButtonBlueLine({
    required this.title,
    required this.func,
    required this.height,
    required this.width,
    super.key,
  });

  @override
  CustomButtonBlueLineState createState() => CustomButtonBlueLineState();
}

class CustomButtonBlueLineState extends State<CustomButtonBlueLine> {
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
        width: MediaQuery.of(context).size.width - widget.width,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ResColors.primaryColor, width: 2.4)),
        child: Center(
          child: _isLoading
              ? Transform.scale(
                  scale: 0.7,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: ResColors.primaryColor,
                  ),
                )
              : Text(
                  widget.title,
                  style: TextStyle(
                    color: ResColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ),
      ),
    );
  }
}
