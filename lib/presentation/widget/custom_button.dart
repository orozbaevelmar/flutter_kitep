import 'package:flutter/material.dart';
import 'package:kitep/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 51,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: MColor.greenPrimary,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 8,
                spreadRadius: 0,
                color: Color(0xFF000000).withOpacity(0.25),
              ),
            ]),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: MTextStyle.ui_16Semi(
            Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
