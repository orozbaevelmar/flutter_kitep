import 'package:flutter/material.dart';
import 'package:kitep/constants/color_constant.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isPdfFileUploaded;
  const CustomCheckBox({super.key, required this.isPdfFileUploaded});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18,
      width: 18,
      child: Checkbox(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        activeColor: Colors.white,
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(width: 2, color: MColor.greenPrimary),
        ),
        checkColor: MColor.greenPrimary,
        value: isPdfFileUploaded,
        onChanged: (value) {},
      ),
    );
  }
}
