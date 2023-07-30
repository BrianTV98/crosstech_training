import 'dart:ffi';

import 'package:flutter/material.dart';

class Kampvie extends StatefulWidget {
  const Kampvie({super.key});

  @override
  State<Kampvie> createState() => _KampvieState();
}

class _KampvieState extends State<Kampvie> {
  var user = {'username': "", 'emailAddress': "", 'password': ""};

  FocusNode forcusEmailAddress = FocusNode();
  FocusNode forcusPassword = FocusNode();

  var inputUserName = "";
  var inputEmailAddress = "";
  var inputPassword = "";
  var inputComfirm = "";

  bool isVisiblePassword = true;
  bool isVisibleConfirm = true;
  bool resultValidateEmailAdress = true;
  bool resultCheckPassword = true;
  bool resultCheckConfirm = true;

  // hàm check địa chỉ email có hợp lệ không
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  //  ham xử lý sự kiện nhấn nút tạo tài khoản
  void btnCreateAccount() {
    if (inputUserName.isEmpty ||
        inputEmailAddress.isEmpty ||
        inputPassword.isEmpty ||
        inputComfirm.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Thông báo'),
              content: const Text('Vui lòng nhập đầy đủ thông tin người dùng'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } else {
      if (!isValidEmail(inputEmailAddress)) {
        setState(() {
          resultValidateEmailAdress = isValidEmail((inputEmailAddress));
        });
        return;
      }
      if (!checkPassword(inputPassword)) {
        setState(() {
          resultCheckPassword = false;
        });
      }
      if (!checkPassword(inputComfirm)) {
        setState(() {
          resultCheckConfirm = false;
        });
      } else if (inputPassword != inputComfirm) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Thông báo'),
                content:
                    const Text('Vui lòng kiểm tra lại password và confirm'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Future.delayed(Duration.zero, () {
                        forcusPassword.requestFocus();
                      });
                    },
                  ),
                ],
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Thông báo'),
                content: Text('Create account successful'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      }
    }
  }

  // hàm check password
  bool checkPassword(String password) {
    bool hasUpper = password.contains(RegExp(r'[A-Z]'));
    bool hasLower = password.contains(RegExp(r'[a-z]'));
    bool hasDigital = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacted = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
    print(hasSpecialCharacted);
    if (password.length < 8) {
      return false;
    } else {
      if (hasUpper == false ||
          hasLower == false ||
          hasDigital == false ||
          hasSpecialCharacted == false) {
        return false;
      }
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          final currenFocus = FocusScope.of(context);
          if (!currenFocus.hasPrimaryFocus) {
            currenFocus.unfocus();
          }
        },
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
            ),
            // resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.jpg'),
                          fit: BoxFit.fill)),
                ),
                ListView(
                  children: [
                    Container(
                    height: 640,
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 194, 191, 183),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        Container(
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage("assets/logokampvie.jpg"),
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                'Welcome to Kampvie',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30, right: 30),
                          width: double.infinity,
                          child: const Text(
                            'Get Started below,',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                        // input thông tin
                        // input username
                        Container(
                          height: 70,
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: TextField(
                            decoration: const InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                labelText: "User name",
                                hintText: "What is your user name?",
                                hintStyle: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder()),
                            onChanged: (newValue) {
                              // print(newValue);
                              setState(() {
                                inputUserName = newValue;
                              });
                            },
                          ),
                        ),
                        // input email address
                        Container(
                            height: 75,
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  focusNode: forcusEmailAddress,
                                  decoration: const InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: "Email Address",
                                      hintText: "Enter your email here?",
                                      hintStyle: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder()),
                                  onChanged: (text) {
                                    setState(() {
                                      inputEmailAddress = text;
                                      resultValidateEmailAdress = true;
                                    });
                                  },
                                ),
                                // ValidateEmail
                                if (!resultValidateEmailAdress)
                                  Text(
                                    'Vui lòng nhập lại địa chỉ email',
                                    style: TextStyle(color: Colors.red),
                                  )
                              ],
                            )),
                        // input password
                        Container(
                            height: 92,
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  focusNode: forcusPassword,
                                  onChanged: (value) {
                                    setState(() {
                                      inputPassword = value;
                                      resultCheckPassword = true;
                                    });
                                  },
                                  obscureText: isVisiblePassword,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isVisiblePassword =
                                                  !isVisiblePassword;
                                            });
                                          },
                                          icon: Icon(isVisiblePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility)),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: "Password",
                                      hintText: "Enter your password here ...",
                                      hintStyle: const TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold),
                                      border: const OutlineInputBorder()),
                                ),
                                if (!resultCheckPassword)
                                  Text(
                                      'Mật khẩu trên 8 ký (ký tự hoa, ký tự thường, số và đặt biệt)',
                                      style: TextStyle(color: Colors.red),
                                      textAlign: TextAlign.center)
                              ],
                            )),
                        // input confirm
                        Container(
                            height: 92,
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      inputComfirm = value;
                                      resultCheckConfirm = true;
                                    });
                                  },
                                  obscureText: isVisibleConfirm,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isVisibleConfirm =
                                                  !isVisibleConfirm;
                                            });
                                          },
                                          icon: Icon(isVisibleConfirm
                                              ? Icons.visibility_off
                                              : Icons.visibility)),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: "Confirm",
                                      hintText: "Confirm your password here...",
                                      hintStyle: const TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold),
                                      border: const OutlineInputBorder()),
                                ),
                                if (!resultCheckConfirm)
                                  const Text(
                                    'Mật khẩu trên 8 ký (ký tự hoa, ký tự thường, số và đặt biệt)',
                                    style: TextStyle(color: Colors.red),
                                    textAlign: TextAlign.center,
                                  )
                              ],
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 20, right: 30),
                          alignment: Alignment.topRight,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              btnCreateAccount();
                            },
                            child: Text(
                              "Create Account",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color:
                                      const Color.fromARGB(255, 165, 228, 222)),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.deepOrangeAccent;
                                }
                                return const Color(0xFF67bd85);
                              }),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0), // Độ cong của đường viền
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
