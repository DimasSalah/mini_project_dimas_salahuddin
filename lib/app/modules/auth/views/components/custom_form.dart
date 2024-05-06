import 'package:flutter/material.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';
import 'package:tatrupiah_si/app/themes/text_style.dart';

// ignore: must_be_immutable
class CustomForm extends StatelessWidget {
  final String title;
  final void Function(String) onChanged;
  bool? obscureText;
  final Widget? icon;
  final String? Function(String?)? validator;

  CustomForm({
    super.key,
    required this.title,
    required this.onChanged,
    this.obscureText,
    this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      style: regular.copyWith(fontSize: 14,color: dark),
      decoration: InputDecoration(
        isDense: false,
        filled: true,
        fillColor: const Color(0xFFECECEC),
        hintText: title,
        hintStyle: const TextStyle(
            color: Color(0xFFC3C3C3), fontWeight: FontWeight.w400),
        enabledBorder:  OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: lighter, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: lighter, width: 1),
        ),
        errorBorder:  OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: error, width: 1),
        ),
      
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: icon ?? null,
        ), 
      ),
    );
  }
}
