import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mechanics/consts/firebase_consts.dart';
import 'package:mechanics/provider/dark_theme_provider.dart';
import 'package:mechanics/screens/auth/forget_pass.dart';
import 'package:mechanics/screens/auth/login.dart';
import 'package:mechanics/screens/loading_manager.dart';
import 'package:mechanics/screens/orders/orders_screen.dart';
import 'package:mechanics/screens/viewed_recently/viewed_recently.dart';
import 'package:mechanics/screens/wishlist/wishlist_screen.dart';
import 'package:mechanics/screens/auth/contact_us.dart';
import 'package:mechanics/services/global_methods.dart';
import 'package:mechanics/widget/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:mechanics/screens/auth/regisrer.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    final Color color2 = themeState.getDarkTheme
        ? Colors.white
        : Color.fromRGBO(119, 16, 76, 0.644);
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                text: 'Hi,  ',
                style: TextStyle(
                  color: color2,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'Welcome to our application, we hope that we can help you',
                    style: TextStyle(
                      color: color,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Divider(
            thickness: 2,
            color: color2,
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          _listTiles(
            title: user == null ? 'Login' : 'Logout',
            icon: user == null ? IconlyLight.login : IconlyLight.logout,
            onPressed: () {
              if (user == null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
                return;
              }
              GlobalMethods.warningDialog(
                  title: 'Sign out',
                  subtitle: 'Do you wanna sign out?',
                  fct: () async {
                    await authInstance.signOut();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  context: context);
            },
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(color: color, fontSize: 18),
                    children: [
                  TextSpan(
                      text: '  Sign up',
                      style: const TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          GlobalMethods.navigateTo(
                              ctx: context,
                              routeName: RegisterScreen.routeName);
                        }),
                ])),
          ),
        ],
      ),
    );
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
