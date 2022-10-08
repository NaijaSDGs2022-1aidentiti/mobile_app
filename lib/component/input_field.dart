import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class CustomInput2 extends StatelessWidget {
  final String? hint;
  final String? label;
  final String? error;
  final String? description;
  final String? type;
  final String? value;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool? obsecure;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const CustomInput2(
      {Key? key,
      this.hint,
      this.label,
      this.error,
      this.description,
      this.value,
      this.suffixIcon,
      this.enabled,
      this.obsecure = false,
      required this.onSaved,
      this.onChanged,
      this.validator,
      this.type})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //maxLengthEnforced: false,
      onSaved: onSaved,
      //enabled: enabled,
      //autofocus: false,
      validator: validator,
      onChanged: onChanged,

      keyboardType: type == 'number'
          ? const TextInputType.numberWithOptions(signed: true, decimal: true)
          : TextInputType.emailAddress,
      maxLength: type == 'number' ? 13 : 100,
      // controller: passwordController,
      //  textInputAction: TextInputAction.next,
      //obscure text will hide the text
      obscureText: obsecure!,
      //enableSuggestions: false,
//autocorrect: false,
      // controller: passwordController,
//autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 2, left: 8),
        counterText: "",
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(width: 0.5, color: Pallete.primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(width: 0.5, color: Color.fromARGB(255, 195, 204, 208))),
        labelText: hint,
        suffixIcon: suffixIcon,
        //errorMaxLines: 1,
        errorText: error,
        hintText: hint,
        hintStyle: const TextStyle(
            color: Pallete.khint,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none),
        labelStyle: AppFonts.body1.copyWith(fontSize: 12, color: const Color(0xFF4F4F4F),),

        //obscure text will hide the text
      ),
    );
  }
}
