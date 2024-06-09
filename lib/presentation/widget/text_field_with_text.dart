import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitep/constants/constants.dart';

class CustomTextFieldWithColumnText extends StatefulWidget {
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController controller;
  final bool canEdit;
  const CustomTextFieldWithColumnText({
    super.key,
    required this.title,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.name,
    this.isPassword = false,
    this.canEdit = true,
  });

  @override
  State<CustomTextFieldWithColumnText> createState() =>
      _CustomTextFieldWithColumnTextState();
}

class _CustomTextFieldWithColumnTextState
    extends State<CustomTextFieldWithColumnText> {
  @override
  void initState() {
    hidePassword = widget.isPassword ? true : false;
    super.initState();
  }

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 14.52 / 12,
              color: Color(0xFF666666),
            ),
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: widget.controller,
          obscureText: hidePassword,
          enableSuggestions: !(widget.isPassword),
          autocorrect: !(widget.isPassword),
          scrollPadding: const EdgeInsets.only(bottom: 200),
          style: MTextStyle.ui_14Regular(const Color(0xff000000)),
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            enabled: widget.canEdit,
            hintText: widget.hintText,
            hintStyle: MTextStyle.ui_16Medium(MColor.gray_03),
            suffixIconConstraints:
                const BoxConstraints(minWidth: 48, minHeight: 0),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    child: Icon(
                      hidePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 18,
                    ),
                  )
                : const SizedBox(height: 0, width: 0),
            filled: true,
            fillColor: MColor.gray_01,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            isDense: true,
            constraints: const BoxConstraints(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: MColor.greenPrimary, width: 1),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
        ),
      ],
    );
  }
}
