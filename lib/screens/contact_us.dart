import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mechanics/screens/auth/login.dart';
import 'package:mechanics/services/global_methods.dart';
import 'package:mechanics/widget/text_widget.dart';
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

class _ContactUsScreenState extends State<ContactUsScreen> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Color.fromRGBO(119, 16, 76, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 40, 25, 0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: 'Name',
                  labelText: 'Name',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: subjectController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.subject_rounded),
                  hintText: 'Subject',
                  labelText: 'Subject',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: messageController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.message),
                  hintText: 'Message',
                  labelText: 'Message',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: const BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  primary: Theme.of(context).colorScheme.secondary,
                  // onPrimary: color,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Your message has been send",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                  );
                  Navigator.pop(context);
                },
                child: TextWidget(
                  text: 'Send',
                  textSize: 20,
                  color: Color.fromRGBO(119, 16, 76, 1),
                  isTitle: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
