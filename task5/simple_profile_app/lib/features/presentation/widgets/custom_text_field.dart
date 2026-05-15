import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.hint,
    this.isPassword = false,
  });

  final TextEditingController textEditingController;
  final String hint;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: widget.isPassword ? obscure : false,
      decoration: InputDecoration(
        labelText: widget.hint,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(
          color: const Color.fromARGB(255, 105, 196, 239),
        )),
        labelStyle: TextStyle(color: const Color.fromARGB(255, 12, 168, 240),),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
              )
            : null,
      ),
      
      validator: (value) => validation(value),
    );
  }

  String? validation(String? value) {
    if (widget.hint.toLowerCase().contains("email")) {
      if (value == null || value.isEmpty) {
        return "Email is required";
      }

      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
        return "Enter valid email";
      }
    } else {
      if (value == null || value.isEmpty) {
        return "Password is required";
      }

      if (value.length < 6) {
        return "Password must be at least 6 characters";
      }
    }

    return null;
  }
}