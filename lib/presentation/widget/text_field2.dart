import 'package:flutter/material.dart';
import 'package:kitep/constants/constants.dart';

class CustomTextField2 extends StatefulWidget {
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField2({
    super.key,
    required this.title,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.name,
    this.isPassword = false,
  });

  @override
  State<CustomTextField2> createState() => _CustomTextFieldWithTextState();
}

class _CustomTextFieldWithTextState extends State<CustomTextField2> {
  @override
  void initState() {
    hidePassword = widget.isPassword ? true : false;
    super.initState();
  }

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: hidePassword,
      enableSuggestions: !(widget.isPassword),
      autocorrect: !(widget.isPassword),
      scrollPadding: const EdgeInsets.only(bottom: 200),
      style: MTextStyle.ui_14Regular(Color(0xff000000)),
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: MTextStyle.ui_16Medium(MColor.gray_03),
        filled: true,
        fillColor: MColor.gray_01,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        isDense: true,
        constraints: const BoxConstraints(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: MColor.greenPrimary, width: 1),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
