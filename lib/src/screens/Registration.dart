import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import './LoginPage.dart';
import './Dashboard.dart';


class SignUpPage extends StatefulWidget {


  SignUpPage();

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  static List data = [];
  List name = [];

    Future register() async {
final response = await http.post("http://10.0.2.2/database/register.php", body: {
      "Mail": emailController.text,
      "Password": passwordController.text,
      "Name": nameController.text,
      "Gender": genderController.text,
      "Phone": phoneController.text,
      "Age": ageController.text
    });
       
        final response4 =
        await http.get("http://10.0.2.2/database/product.php");
    
     if (response4.statusCode == 200) {
      setState(() {
        data = json.decode(response4.body);
      });
    }
    String jsonsDataString = response.body.toString();
    print(jsonsDataString+"<<<<<<");
    var datauser = json.decode(jsonsDataString);
    if(datauser =="Error"){
      Fluttertoast.showToast(
        msg: "User already exists",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );}
    else{
      Fluttertoast.showToast(
        msg: "Registration Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    sleep(const Duration(seconds: 1));
    
    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: LoginPage()));
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Text('Sign Up',
            style: TextStyle(
                color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              // Navigator.of(context).pushReplacementNamed('/signin');
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: LoginPage()));

            },
            child: Text('Sign In', style: contrastText),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Welcome to Sirius!', style: h3),
                Text('Let\'s get started', style: taglineText),
                siriusTextInput('E-mail', emailController),
                siriusTextInput('Full Name', nameController),
                siriusPasswordInput('Password', passwordController),
                siriusTextInput("Gender", genderController),
                siriusTextInput("Age", ageController),
                siriusTextInput("Phone", phoneController),
              ],
            ),
            Positioned(
              bottom: 15,
              right: -15,
              child: FlatButton(
                onPressed: () {
                   register();
                },
                color: primaryColor,
                padding: EdgeInsets.all(13),
               shape: CircleBorder(),
                child: Icon(Icons.arrow_forward, color: white),
              ),
            )
          ],
        ),
        height: MediaQuery.of(context).size.height *0.75,
        
        width: double.infinity,
        decoration: authPlateDecoration,
      ),
        ],
      )
    );
  }
}