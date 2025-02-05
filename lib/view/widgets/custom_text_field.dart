import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:univesity_clubs/data/tools/const/res_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool hasPrefixIcon;
  final int maxLength;
  final bool textNotValid;
  final ValueChanged<String>? onChanged;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.hasPrefixIcon,
    required this.maxLength,
    required this.textNotValid,
        this.onChanged,
  }

);


  @override
  Widget build(BuildContext context) {
    final maskFormatter = MaskTextInputFormatter(
        mask: '(##) ###-##-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return Center(
      child: Container(
        // padding: EdgeInsets.only(left: 4.w),
        width: MediaQuery.sizeOf(context).width - 34,
        decoration: BoxDecoration(
          color: ResColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          onChanged: onChanged,
          inputFormatters: hasPrefixIcon ? [maskFormatter] : null,
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength > 0 ? maxLength : null,
          style: const TextStyle(color: ResColors.primaryBlackText,
              fontWeight: FontWeight.w700),
          decoration: InputDecoration(
              counterText: "",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: textNotValid
                      ? ResColors.emptyError
                      : ResColors.blackWithOpacity,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: textNotValid
                      ? ResColors.emptyError
                      : ResColors.blackWithOpacity,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: Color(0xffABAFB6)),
              prefixIcon: hasPrefixIcon
                  ? Container(
                      padding: const EdgeInsets.only(top: 13, left: 12),
                      child: Text(
                        "+998 ",
                        style: TextStyle(fontSize: 16.4, fontWeight: FontWeight.w700),
                      ),
                    )
                  : null),
        ),
      ),
    );
  }
}
