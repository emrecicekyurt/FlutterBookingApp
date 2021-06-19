import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sirius/src/shared/partials.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/inputFields.dart';
import 'package:page_transition/page_transition.dart';
import './Registration.dart';
import './Dashboard.dart';
import 'LoginPage.dart';
import 'ProductsOfStore.dart';
import 'Update.dart';

class UpdateBody extends StatefulWidget {
  final String storeName;
  final List data;
  final List stores;
  final List name;
  UpdateBody(this.storeName, this.data, this.stores, this.name);

  @override
  _UpdateBodyState createState() => _UpdateBodyState(storeName,data, stores, name);
}
List<String> StoreNames = ["Store1", "Store2", "Store3", "Store4", "Store5"];
class _UpdateBodyState extends State<UpdateBody> {
  int _selectedIndex = 0;
 final String storeName;
 List data;
  List name;
  _UpdateBodyState(this.storeName, this.data, this.stores, this.name);
  List has = [];
  List stores=[];
Future<List?>fetch() async{
        final res =
        await http.post("http://10.0.2.2/database/has.php", body: {
      "Store_name": storeName,  
    });
    
     if (res.statusCode == 200) {
      setState(() {
        has = json.decode(res.body);
      });
    }
  
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }
  @override
  Widget build(BuildContext context) {
        final _tabs = [
      bodyPage(storeName, context, has, name)
      
    ];
        return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: Update(true, stores, name)));
            },
            iconSize: 21,
            icon: Icon(Icons.arrow_left),
          ),
          backgroundColor: Colors.amber[900],
          title: Text('Update', textAlign: TextAlign.center),
        ),
        body: _tabs[_selectedIndex]
        );
  }
  
}

Widget bodyPage(String storeName,BuildContext context, List has, List name){
  return Scaffold(
    body:ListView(children: <Widget>[
          dealsColm('Here is the products', context,
              onViewMore: () {},
              items: <Widget>[
               Stack(children: <Widget>[
                  leftContainerUpdate(has, context, name),
                  rightContainerUpdate(has,context, name)
                ])
               
              ]),
        ]));
}