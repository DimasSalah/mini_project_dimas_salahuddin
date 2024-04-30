import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final String title;
  final void Function(String) onChanged;

  const CustomForm({
    super.key,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: const TextStyle(
          color: Color.fromARGB(255, 173, 172, 172),
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        isDense: false,
        filled: true,
        fillColor: const Color(0xFFECECEC),
        hintText: title,
        hintStyle: const TextStyle(
            color: Color(0xFFC3C3C3), fontWeight: FontWeight.w400),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}
