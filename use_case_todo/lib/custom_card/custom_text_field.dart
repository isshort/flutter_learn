import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.hinText,
    this.controller,
    this.keyBoardType,
    this.color,
    this.mask,
    this.onChange,
    this.onTap,
    this.textAlign = TextAlign.center,
    this.readOnly = false,
    super.key,
    this.margin,
    this.validator,
    this.initialValue,
    this.label,
    this.maxLength,
  });

  final String? hinText;
  final Color? color;
  final EdgeInsets? margin;
  final TextAlign textAlign;
  final TextInputType? keyBoardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? mask;
  final void Function(String)? onChange;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;
  final String? initialValue;
  final String? label;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color ?? const Color(0xFFF2F2F9),
      ),
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: TextFormField(
        maxLength: maxLength,
        initialValue: initialValue,
        textAlign: textAlign,
        keyboardType: keyBoardType,
        controller: controller,
        inputFormatters: mask,
        onChanged: onChange,
        onTap: onTap,
        readOnly: readOnly,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'please fill your input';
              }
              return null;
            },
        decoration: InputDecoration(
          counterText: '',
          hintText: hinText,
          filled: false,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          label: Text(
            label ?? '',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ),
    );
  }
}
