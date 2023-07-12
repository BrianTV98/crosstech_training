import 'package:crosstech_trainning/extension/build_context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormFieldState> pwStateKey =  GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(20));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(30)),
                child: const Center(
                  child: Text(
                    'Đăng nhập để học ngay nhé',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18, height: 3),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                // key: pwStateKey,
                decoration: InputDecoration(
                  border: border,
                ),
                validator: (text) {
                  if (text == null) return '';
                  if (text.length < 6) {
                    return 'Mật khẩu quá ngắn';
                  }
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                key: pwStateKey,
                decoration: InputDecoration(
                  border: border,
                ),
                validator: (text) {
                  if (text == null) return '';
                  if (text.length < 6) {
                    return 'Mật khẩu quá ngắn';
                  }
                },
              ),
              const ElevatedButton(
                onPressed:null,//(){},
                child: Text('Đăng nhập'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
