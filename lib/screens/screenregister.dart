import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:provider/provider.dart';

import '../components/buttonfield.dart';
import '../components/roundedinputfield.dart';
import '../components/textfieldcontainer.dart';
import '../constants/constants.dart';
import '../services/firebaseauth.dart';

// void main() {
//   runApp(MaterialApp(
//     home: ScreenLogin(),
//   ));
// }

class ScreenRegister extends StatefulWidget {
  static String routeName = '/signup-email-password';

  @override
  _ScreenRegisterState createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(25, 31, 61, 0),
              Color.fromRGBO(0, 148, 227, 1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70),
                ),
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    image,
                    height: height * 0.30,
                    width: width * 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 100),
              SizedBox(
                child: SingleChildScrollView(
                  child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                    child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        // totalRepeatCount: 10,
                        // repeatForever: false,
                        pause: Duration(microseconds: 100),
                        animatedTexts: [FadeAnimatedText(login)]),
                  ),
                ),
              ),
              SizedBox(height: 50),
              RoundedInputField(
                labelText: "User ID",
                onChanged: (value) {},
                controller: emailController,
              ),
              TextFieldContainer(
                controller: passwordController,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.blueGrey,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: Colors.blueGrey,
                      ),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Get.to(() => ScreenRegister(), transition: Transition.fade);
                },
                child: ButtonField(
                  text: "REGISTER",
                  press: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
