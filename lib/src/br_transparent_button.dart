import 'package:flutter/material.dart';

class BRTransparentButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final Color color;
  final double width, height, horizontal, vertical;
  const BRTransparentButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.isLoading,
    required this.color,
    this.width = double.infinity,
    this.height = 50.0,
    this.horizontal = 16.0,
    this.vertical = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: color.withOpacity(0.25),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? CircularProgressIndicator(
                      color: color,
                    )
                  : Text(
                      text,
                      style: TextStyle(
                        color: color,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                      // textScaleFactor: 1,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
