import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import './Registration.dart';
import './Dashboard.dart';
import './Update.dart';


class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool authorized =false;
   static List data= [];
  List stores= [];
    List name=[];
  
    
    
 

  Future<List?> login() async {
    final response =
        await http.post("http://10.0.2.2/database/login.php", body: {
      "Mail": emailController.text,
      "Password": passwordController.text,
      
      
    });
    final response2=await http.post("http://10.0.2.2/database/loginemp.php", body: {
      "Mail": emailController.text,
      "Password": passwordController.text,
      
      
    });

    final response4 =
        await http.get("http://10.0.2.2/database/product.php");
    
     if (response4.statusCode == 200) {
      setState(() {
        data = json.decode(response4.body);
      });
    }
       final resp =
        await http.get("http://10.0.2.2/database/store.php");
    
     if (resp.statusCode == 200) {
      setState(() {
        stores = json.decode(resp.body);
      });
    }
    String jsonsDataString2=response2.body.toString();
    String jsonsDataString = response.body.toString();
    
      name= json.decode(jsonsDataString);
    
    
    
 
    
    
    
    if (jsonsDataString.contains("Client_id") || jsonsDataString2.contains("Person_id")) {
      if(jsonsDataString2.contains("Person_id")){
        setState(() {
          name=json.decode(jsonsDataString2);
          authorized=true;
          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: Update(authorized, stores, name)));
        });
      }else{
        name = json.decode(jsonsDataString);
         Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: Dashboard(pageTitle: 'Dashboard', authorized: authorized, data: data, name: name,)));
      }
     
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Warning'),
          content: const Text('Wrong Email or Password'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
   
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: Text('Sign In',
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed('/signup');
             Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft,  child: SignUpPage()));
              },
              child: Text('Sign Up', style: contrastText),
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
                      Text('Welcome Back!', style: h3),
                      Text('Howdy, let\'s authenticate', style: taglineText),
                      siriusTextInput('E-Mail', emailController),
                      siriusPasswordInput('Password', passwordController ),
                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    right: -15,
                    child: FlatButton(
                      onPressed: () { setState(() {
                        login();
                      });
                        },
                      color: primaryColor,
                      padding: EdgeInsets.all(13),
                      shape: CircleBorder(),
                      child: Icon(Icons.arrow_forward, color: white),
                    ),
                  )
                ],
              ),
              height: 245,
              width: double.infinity,
              decoration: authPlateDecoration,
            ),
          ],
        ));
  }
}
