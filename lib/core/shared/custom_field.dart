import 'package:flutter/material.dart';

import '../../../../core/constants/dimensions.dart';

class CustomField extends StatefulWidget {
  CustomField(
      {super.key,
      required this.prefixIcon,
       this.label,
      required this.hint,
      required this.onChanged,
      this.textInputType = TextInputType.text,
      this.isPassword,
        this.controller,
        this.isFilled = true,
       this.validator});
  final Widget prefixIcon;
  final TextInputType textInputType;
  final String? label;
  final String hint;
  final bool isFilled;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final String? Function(String?)? validator;

  late bool? isPassword;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CustomTitle(
        //   text: widget.label,
        //   fontSize: Dimensions.screenHeight * 0.028,
        //   fontWeight: FontWeight.w600,
        // ),
        // SizedBox(
        //   height: Dimensions.screenHeight * 0.01,
        // ),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.textInputType,
          onChanged: widget.onChanged,
          obscureText: widget.isPassword != null ? widget.isPassword! : false,
          decoration: InputDecoration(
            labelText: widget.label,
            filled: widget.isFilled,
            fillColor: Colors.grey[200],
            // Background color
            hintText: widget.hint,
            hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.grey,
                ),
            // Hint text color
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(Dimensions.radius05), // Border radius
              borderSide: BorderSide.none, // No border side
            ),
            suffixIcon: widget.isPassword != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.isPassword = !widget.isPassword!;
                      });
                    },
                    icon: widget.isPassword!
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility))
                : null,
            prefixIcon: widget.prefixIcon, // Prefix icon
          ),
        ),
      ],
    );
  }
}
