import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController codeController;
  final TextInputType textInputType;
  final String labelText;
  final bool isPassword;
  final FocusNode focusNode;
  final Icon? suffixIcon;
  final InputDecoration? inputDecoration;
  const CustomTextFormField(
      {Key? key,
      required this.codeController,
      required this.textInputType,
      required this.labelText,
      this.isPassword = false,
      required this.focusNode,
      this.suffixIcon,
      this.inputDecoration})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.width * 0.7,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Bu alan boş kalmamalı";
                }
                if (value.length < 6) {
                  return "6 dan küçük olamaz";
                }
                if (value.length > 20) {
                  return "20 den büyük olamaz";
                }
              },
              focusNode: widget.focusNode,
              controller: widget.codeController,
              keyboardType: widget.textInputType,
              obscureText: widget.isPassword,
              decoration: InputDecoration(
                labelText: widget.labelText,
                labelStyle: context.textTheme.headline5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
