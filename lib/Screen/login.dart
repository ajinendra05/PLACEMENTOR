import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:placementor/Data/constantData.dart';

import '../Data/Auth.dart';
import 'forgetPassword.dart';
import 'homeScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<FocusNode> focusNodes = List.generate(2, (index) => FocusNode());
  List<TextEditingController> controllers =
      List.generate(2, (index) => TextEditingController());
  // String email;
  // String password;
  final _formKey = GlobalKey<FormState>();

  void signIN() async {
    User user;
    try {
      user = await Auth().signIn(
          email: controllers[0].text.trim(), password: controllers[1].text);
      print('Signed in:' + user.uid);

      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      SnackBar(
        content: Text("$e"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kcprimary2,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: height * 0.4,
            width: width,
            color: const Color.fromRGBO(255, 173, 110, 1),
            child: Padding(
              padding: EdgeInsets.only(left: width / 20, bottom: height / 24),
              child: Image.asset('assets/Images/save.png'),
              //  SvgPicture.asset('assets/Images/login.svg',
              //     width: width / 3, height: height / 3.1, fit: BoxFit.contain),
            ),
          ),
          Container(
            height: height * 0.8,
            width: width,
            // color: const Color.fromARGB(255, 255, 250, 230),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 214, 212, 206),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: height / 40,
                  ),
                  child: Text('Student Login',
                      style: kmerriweater.copyWith(
                          color: const Color.fromARGB(255, 64, 46, 50),
                          fontWeight: FontWeight.w800,
                          fontSize: height / 25)),
                ),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 0,
                    ),
                    child: SizedBox(
                        height: height * 0.23,
                        width: width,
                        child: Form(
                          key: _formKey,
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 10,
                                  right: width / 10,
                                  bottom: height / 32,
                                  top: height / 25),
                              child: SizedBox(
                                height: height * 0.06,
                                width: width,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter valid email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'Username',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Manrope',
                                          fontSize: 18.5),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.black)),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.black),
                                      ),
                                      focusColor: Colors.black),
                                  focusNode: focusNodes[0],
                                  controller: controllers[0],
                                  autofocus: false,
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(focusNodes[0]),
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (value) =>
                                      FocusScope.of(context)
                                          .requestFocus(focusNodes[1]),
                                  // onSaved: (v) {
                                  //   FocusScope.of(context)
                                  //       .requestFocus(focusNodes[1]);
                                  // },
                                  cursorColor: Colors.black,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Manrope',
                                      fontSize: 18.5),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 10,
                                  right: width / 10,
                                  bottom: height / 30),
                              child: SizedBox(
                                height: height * 0.06,
                                width: width,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter valid email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  cursorColor: Colors.black,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Manrope',
                                          fontSize: 18.5),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.black)),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.black),
                                      ),
                                      focusColor: Colors.black),
                                  focusNode: focusNodes[1],
                                  controller: controllers[1],
                                  autofocus: false,
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(focusNodes[1]),
                                  keyboardType: TextInputType.visiblePassword,
                                  onSaved: (v) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Manrope',
                                      fontSize: 18.5),
                                ),
                              ),
                            ),
                          ]),
                        ))),
                Padding(
                  padding: EdgeInsets.only(
                      left: width / 18, right: width / 18, top: height / 55),
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(78, 89, 111, 1),
                        borderRadius:
                            BorderRadius.all(Radius.circular(width / 50))),
                    child: TextButton(
                      onPressed: () {
                        signIN();
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.resolveWith<EdgeInsets>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return EdgeInsets.all(width / 30);
                          }
                          return EdgeInsets
                              .zero; // Use the component's default.
                        }),
                        shape:
                            MaterialStateProperty.resolveWith<OutlinedBorder>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(width / 50));
                          }
                          return const RoundedRectangleBorder(); // Use the component's default.
                        }),
                      ),
                      child: Text(
                        'Sign-In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Manrope',
                            fontSize: height / 55),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width / 18, right: width / 18, top: height / 55),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetPassword(),
                          ));
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith<EdgeInsets>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return EdgeInsets.all(width / 30);
                        }
                        return EdgeInsets.zero; // Use the component's default.
                      }),
                      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width / 50));
                        }
                        return const RoundedRectangleBorder(); // Use the component's default.
                      }),
                    ),
                    child: Text(
                      'Forget Password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Manrope',
                          fontSize: height / 55),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
