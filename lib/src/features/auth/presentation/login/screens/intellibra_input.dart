import 'package:flutter/material.dart';

class AkilaInput extends StatefulWidget {
  const AkilaInput(
      {required this.label, required this.hint, required this.controller, required this.obscureText, super.key,
      this.validator,
      this.isActive,
      this.keyboardType,
      this.prefix,
      this.suffix,});
  final String label;
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool? isActive;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  State<AkilaInput> createState() => _AkilaInputState();
}

class _AkilaInputState extends State<AkilaInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          enabled: widget.isActive ?? true,
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          label: Text(widget.label),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: widget.hint,
        ),
      ),
    );
  }
}
