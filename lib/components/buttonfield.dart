
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../screens/screenlogin.dart';
import '../views/home_page_view.dart';

class ButtonField extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const ButtonField({
    Key? key,
    required this.text,
    required this.press,
    this.color = kSecondaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.07,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: color, shadowColor: Colors.white),
            onPressed: () {
             Navigator.of(context).push(_createRoute());
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ScreenLogin(),));
            },
            child: Text(
              text,
              style: TextStyle(
                  color: textColor, fontSize: 17, fontWeight: FontWeight.w700),
            )),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) => HomePageView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
