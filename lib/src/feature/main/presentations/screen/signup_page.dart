//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../../core/commonts/app_colors.dart';
// import '../../../../core/constances/assets_path.dart';
//
// class SignUpScreen extends StatefulWidget {
//   final LoginCubit bloc;
//
//   const SignUpScreen({Key? key, required this.bloc}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   bool isValid = false;
//
//   void updateButtonState() {
//     setState(() {
//       isValid = widget.bloc.email.isNotEmpty &&
//           widget.bloc.password.isNotEmpty &&
//           widget.bloc.confirmPassword.isNotEmpty &&
//           widget.bloc.password == widget.bloc.confirmPassword;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_rounded,
//               color: AppColors.paraColor,
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         shadowColor: Colors.transparent,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 ImageAssetPath.logoSignup,
//                 height: 250,
//               ),
//               const SizedBox(height: 20),
//               TextFormFeldLogin(
//                 onChange: (value) {
//                   widget.bloc.setEmail(value ?? '');
//                   updateButtonState();
//                 },
//                 hintext: tr('login.hintex_email'),
//               ),
//               const SizedBox(height: 17),
//               TextFormFeldLogin(
//                 isObscure: true,
//                 onChange: (value) {
//                   widget.bloc.setPassword(value ?? '');
//                   updateButtonState();
//                 },
//                 hintext: tr('login.hintext_signup_password'),
//               ),
//               const SizedBox(height: 17),
//               TextFormFeldLogin(
//                 isConfirmPassword: true,
//                 confirmErrorVisible: widget.bloc.password.isNotEmpty &&
//                     widget.bloc.password != widget.bloc.confirmPassword,
//                 isObscure: true,
//                 onChange: (value) {
//                   widget.bloc.setConfirmPassword(value ?? '');
//
//                   updateButtonState();
//                 },
//                 hintext: tr('login.hintex_confirm_password'),
//               ),
//               const SizedBox(height: 25),
//               BlocBuilder<LoginCubit, LoginState>(
//                 bloc: widget.bloc,
//                 builder: (context, state) {
//                   return ChoseLogin(
//                     color: isValid ? Colors.green : Colors.grey,
//                     width: MediaQuery.of(context).size.width / 1.9,
//                     textButtonLogin: tr('login.button_signup'),
//                     height: MediaQuery.of(context).size.height / 17,
//                     ontap: isValid
//                         ? () {
//                             widget.bloc.signup();
//                           }
//                         : null,
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
