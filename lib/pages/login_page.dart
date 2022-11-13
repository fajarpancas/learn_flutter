import 'package:first_flutter/custom/custom_button.dart';
import 'package:first_flutter/navigation/bottom_tabs.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPass = false;

  onShowHidePass() {
    setState(() {
      showPass = !showPass;
    });
  }

  checkEmailValidation(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  checkPasswordValidation(String password) {
    if (password.length >= 6) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  colors: [Colors.white12, Colors.pink])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                color: Colors.red,
                child: const Text('Welcome to flutter',
                    softWrap: false,
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
              ),
              //form email
              buildForm(
                  'Email',
                  'Enter your email',
                  Icons.person,
                  checkEmailValidation(usernameController.text)
                      ? const Icon(
                          Icons.check_circle_sharp,
                          color: Colors.green,
                        )
                      : null,
                  checkEmailValidation(usernameController.text)
                      ? 'Valid!'
                      : null,
                  usernameController.text == '' ||
                          checkEmailValidation(usernameController.text)
                      ? null
                      : 'Invalid email',
                  usernameController, (value) {
                setState(() {});
              }, false),
              //form password
              buildForm(
                  'Password',
                  'Enter your password',
                  Icons.lock,
                  IconButton(
                    icon: Icon(
                        showPass ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey),
                    onPressed: () {
                      onShowHidePass();
                    },
                  ),
                  null,
                  passwordController.text == '' ||
                          checkPasswordValidation(passwordController.text)
                      ? null
                      : 'Password min 6 length',
                  passwordController, (value) {
                setState(
                  () {},
                );
              }, !showPass),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: buildCustomButton(
                    'Sign In',
                    () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const BottomTabs();
                        })),
                    [Colors.pink, Colors.red],
                    340 * MediaQuery.of(context).size.width / 375,
                    40 * MediaQuery.of(context).size.height / 600,
                    20),
              ),
            ],
          )),
    );
  }

  Widget buildForm(
      String label,
      String hintText,
      dynamic icon,
      dynamic suffixIcon,
      dynamic suffixText,
      dynamic errorText,
      dynamic controller,
      dynamic onChanged,
      bool obsecureText) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: TextField(
        obscureText: obsecureText,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.black,
            ),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: suffixIcon,
            suffixStyle: const TextStyle(color: Colors.green),
            suffixText: suffixText,
            label: Text(label),
            hintText: hintText,
            errorText: errorText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.yellow, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.yellow)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.green))),
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}
