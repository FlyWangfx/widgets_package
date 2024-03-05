import 'package:flutter/material.dart';

class PasswordText extends StatefulWidget {
  final String? hintText;
  final bool passwordVisible;
  final TextEditingController passwordController;

  const PasswordText({
    Key? key,
    this.hintText,
    required this.passwordVisible,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<PasswordText> createState() => _PasswordTextState();
}

class _PasswordTextState extends State<PasswordText> {
  late bool passwordVisible;

  @override
  void initState() {
    super.initState();
    passwordVisible = widget.passwordVisible;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: widget.passwordController,
      obscureText: passwordVisible, //密码输入类型
      decoration: InputDecoration(
        icon: const Icon(Icons.lock),
        hintText: widget.hintText ?? '',
        suffixIcon: IconButton(
          icon: Icon(
            passwordVisible ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
        ),
      ),
    );
  }
}
