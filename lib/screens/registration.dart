import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/services.dart';
import '../utils/routes.dart';

class RegistrationScreen extends StatelessWidget {
  // const RegistrationScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(BuildContext context, String email, password) async {
    try {
      final uri = Uri.parse('https://flutterassignment.herokuapp.com/login');
      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {
        "email": email,
        "password": password
      };
      String jsonBody = json.encode(body);
      final encoding = Encoding.getByName('utf-8');

      Response response = await post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );

      

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        // print(data['token']);
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(
          SnackBar(
            content: const Text('Account was login successfully'),
            action: SnackBarAction(
                label: 'close', onPressed: scaffold.hideCurrentSnackBar),
          ),
        );

        Navigator.pushNamed(context, MyRoutes.dashboardRoute);
        print('Login successfully');
      } else {
        var data = jsonDecode(response.body.toString());
        print(data);
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(
          SnackBar(
            content: const Text('Login Failed'),
            action: SnackBarAction(
                label: 'close', onPressed: scaffold.hideCurrentSnackBar),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset(
            "assets/images/back_icon.png",
            scale: 2.2,
          ),
        ),
      ),
      body: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffEBF8EE),
                  radius: 36,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      "assets/images/app_logo.png",
                      scale: 4.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Please login to continue..",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xff979899)),
                  ),
                ),
                SizedBox(
                  height: 64,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, MyRoutes.dashboardRoute);
                      print(emailController.text.toString());
                      print(passwordController.text.toString());
                      login(context, emailController.text.toString(),
                          passwordController.text.toString());
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      shape: StadiumBorder(),
                      backgroundColor: Color(0xff23AA49),
                    ),
                    child: Text("LOGIN")),
              ),
              SizedBox(
                height: 16,
              ),
              // Container(
              //     margin: const EdgeInsets.symmetric(horizontal: 32),
              //     child: RichText(
              //       textAlign: TextAlign.center,
              //       text: TextSpan(
              //         text:
              //             "By clicking on “Continue” you are agreeing to our ",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w500,
              //             color: Color(0xffA9A9AA),
              //             fontSize: 12),
              //         children: <TextSpan>[
              //           TextSpan(

              //               text: "terms of use",
              //               style: TextStyle(
              //                   decoration: TextDecoration.underline,
              //                   fontWeight: FontWeight.w600,
              //                   color: Color(0xff5D5FEF))),
              //         ],
              //       ),
              //     )),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text('Sign Up',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff23AA49))),
                    onPressed: () {
                      //signup screen
                      Navigator.pushNamed(context, MyRoutes.signUpRoute);
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
