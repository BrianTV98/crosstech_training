import 'package:cross_tech/src/core/extension/build_context_extension.dart';
import 'package:cross_tech/src/extension/build_context_extension.dart';
import 'package:cross_tech/src/feature/auth/presentation/component/chose_login.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../blocs/login/login_cubit.dart';
import '../../../../constances/assets_path.dart';
import '../blocs/login/login_cubit.dart';
import '../commonts/app_colors.dart';
import '../constances/assets_path.dart';
import 'text_form_field_login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key, required this.bloc}) : super(key: key);
  final LoginCubit bloc;
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  void updateButtonState() {
    setState(() {
      widget.bloc.email.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: AppColors.paraColor,
              size: 34,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Image.asset(
              ImageAssetPath.forgotPassword,
              width: context.widthScreen / 1.5,
              height: context.heightScreen / 4,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              tr('forgot_password.title_email'),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            TextFormFieldLogin(
              onChange: (value) {
                widget.bloc.setEmail(value ?? '');
                updateButtonState();
              },
              hintext: tr('login.hintex_email'),
            ),
            const SizedBox(height: 15),
            ChoseLogin(
              ontap: () {
                widget.bloc.resetPassword();
              },
              color: widget.bloc.email.isNotEmpty ? Colors.green : null,
              height: context.heightScreen / 14,
              width: context.widthScreen / 1.5,
              textButtonLogin: tr('forgot_password.title_button'),
            ),
          ],
        ),
      ),
    );
  }
}
