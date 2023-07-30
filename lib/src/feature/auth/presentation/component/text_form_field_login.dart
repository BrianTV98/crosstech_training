import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/string_helper.dart';

class TextFormFieldLogin extends StatefulWidget {
  const TextFormFieldLogin({
    Key? key,
    this.hintext,
    this.onChange,
    this.isObscure = false,
    this.isConfirmPassword = false,
    this.passwordController,
    this.confirmErrorText,
    this.confirmErrorVisible = true,
  }) : super(key: key);

  final String? hintext;
  final Function(String?)? onChange;
  final bool? isObscure;
  final bool isConfirmPassword;
  final String? confirmErrorText;
  final TextEditingController? passwordController;
  final bool confirmErrorVisible;
  @override
  State<TextFormFieldLogin> createState() => _TextFormFieldLoginState();
}

class _TextFormFieldLoginState extends State<TextFormFieldLogin> {
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        obscureText: _isObscure,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.onChange,
        decoration: InputDecoration(
          suffixIcon: widget.isObscure!
              ? IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              : null,
          hintText: widget.hintext,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        validator: (value) {
          if (widget.hintext == tr('login.hintex_email') &&
              !StringHelper.isEmail(value!)) {
            return tr('login.error_email');
          }
          if (widget.hintext == tr('login.hintext_signup_password') &&
              !StringHelper.isPassword(value!)) {
            return tr('login.error_password');
          }
          if (widget.isConfirmPassword && widget.confirmErrorVisible) {
            if (value != widget.passwordController?.text) {
              return widget.confirmErrorText ??
                  tr('login.error_confirm_password');
            }
          }

          return null;
        },
      ),
    );
  }
}
