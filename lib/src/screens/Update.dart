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
import 'UpdateBody.dart';

class Update extends StatefulWidget {
  final bool authorized;
  final List stores;
  final List name;
  Update(this.authorized, this.stores, this.name);

  @override
  _UpdateState createState() => _UpdateState(authorized, stores, name);
}

class _UpdateState extends State<Update> {
  int _selectedIndex = 0;
  final bool authorized;
  _UpdateState(this.authorized, this.stores, this.name);
    List data = [];
    List stores= [];
    List name = [];
Future<List?>fetch() async{
      final response4 =
        await http.get("http://10.0.2.2/database/product.php");
    
     if (response4.statusCode == 200) {
      setState(() {
        data = json.decode(response4.body);
      });
    }
  
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }
  List<String> getStoreNames(List stores) {
 List<String> storeNames= [];
 for(int i=0; i<stores.length; i++){
   StoreNames.add(stores[i]["Store_name"]);
 }
  return storeNames;
}
  @override
  Widget build(BuildContext context) {
    print(getStoreNames(stores));
        final _tabs = [
      storeWidget(context, data, stores, name),
      profilePage(context, authorized, name)
      
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
                      child: LoginPage()));
            },
            iconSize: 21,
            icon: Icon(Icons.arrow_left),
          ),
          backgroundColor: Colors.amber[900],
          title: Text('Update', textAlign: TextAlign.center),
        ),
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                title: Text(
                  'Update',
                  style: tabLinkStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: tabLinkStyle,
                )),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green[600],
          onTap: _onItemTapped,
        ));
        
  }
    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Widget storeWidget(BuildContext context, List data, List stores, List name) {
  getStoreNames(stores);
  
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('Stores', onViewMore: () {}),
      SizedBox(
        height: MediaQuery.of(context).size.height*0.7,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[        
            headerCategoryItemUp(getStoreNames(stores)[0],getStoreNames(stores)[1], Icons.store_mall_directory,data, stores, name, context, ),
           headerCategoryItemUp(getStoreNames(stores)[2],getStoreNames(stores)[3], Icons.store_mall_directory,data, stores, name,  context, ),
           headerCategoryItemUp(getStoreNames(stores)[4],getStoreNames(stores)[5], Icons.store_mall_directory,data, stores, name,  context, ),
           headerCategoryItemUp(getStoreNames(stores)[6],getStoreNames(stores)[7], Icons.store_mall_directory,data,stores, name,  context, ),
           headerCategoryItemUp(getStoreNames(stores)[8],getStoreNames(stores)[9], Icons.store_mall_directory,data,stores, name,  context, ),
           headerCategoryItemUp(getStoreNames(stores)[10],getStoreNames(stores)[11], Icons.store_mall_directory,data,stores, name,  context, ),
           headerCategoryItemUp(getStoreNames(stores)[12],getStoreNames(stores)[13], Icons.store_mall_directory,data,stores, name,  context, ),
           headerCategoryItemUp(getStoreNames(stores)[14],getStoreNames(stores)[15], Icons.store_mall_directory,data,stores, name,  context, ),

          ],
        ),
      )
    ],
  );
}
Widget headerCategoryItemUp(String name1, String name2, IconData icon, List data, List stores, List name,BuildContext context, {onPressed}) {
 
  return Container(
    margin: EdgeInsets.only(left: 7),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(children: [
          SizedBox(width: 25,),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width*0.2,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name1,
              onPressed:(){
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: UpdateBody(name1, data, stores, name)));
  },
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name1 + ' ›', style: categoryText),
        SizedBox(width: 5,),
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width*0.2,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name2,
                 onPressed:(){
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: UpdateBody(name2, data, stores, name)));
  },
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
            Text(name2 + ' ›', style: categoryText),
            ]
        )
      ],
    ),
  );
}