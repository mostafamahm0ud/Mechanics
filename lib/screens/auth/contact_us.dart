import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mechanics/widget/back_widget.dart';
import 'package:mechanics/widget/text_widget.dart';
import 'package:mechanics/screens/loading_manager.dart';
import 'package:mechanics/widget/auth_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactUsScreen extends StatefulWidget {
  static const routeName = '/ContactUsScreen';

  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

final nameController = TextEditingController();
final subjectController = TextEditingController();
final emailController = TextEditingController();
final messageController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _ContactUsScreenState extends State<ContactUsScreen> {
  bool check = true;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Contact Us'),
      //   backgroundColor: Color.fromRGBO(119, 16, 76, 0.644),
      // ),
      body: Container(
        color: Color.fromRGBO(119, 16, 76, 0.644),
        child: LoadingManager(
          isLoading: _isLoading,
          child: Stack(children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 25.0,
                    ),
                    const BackWidget(),
                    Center(
                      child: Container(
                        height: 120.0,
                        child: Image.asset(
                          "assets/images/MLOGO.png",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      text: 'Contact Us',
                      color: Colors.white,
                      textSize: 30,
                      isTitle: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.account_circle),
                              hintText: 'Name',
                              labelText: 'Name',
                              iconColor: Colors.white54,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: subjectController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the subject';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.subject_rounded),
                              hintText: 'Subject',
                              labelText: 'Subject',
                              iconColor: Colors.white54,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: messageController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your message';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              icon: Icon(Icons.message),
                              hintText: 'Message',
                              labelText: 'Message',
                              iconColor: Colors.white54,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AuthButton(
                            buttonText: 'Send',
                            fct: () {
                              if (_formKey.currentState!.validate()) {
                                Fluttertoast.showToast(
                                  msg: "Your message has been send",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                );
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
