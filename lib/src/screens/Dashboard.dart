import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sirius/src/screens/ProductsOfStore.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import './ProductPage.dart';
import '../shared/Product.dart';
import '../shared/partials.dart';
import 'LoginPage.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  final String pageTitle;
  final bool authorized;
  final List data;
  final List name;
  Dashboard( {required this.pageTitle, required this.authorized, required this.data, required this.name});

  @override
  _DashboardState createState() => _DashboardState(authorized, data, name);
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final bool authorized;
  final List data;
  final List name;

  List stores= [];
  List removed = [];
 _DashboardState(this.authorized, this.data, this.name);

Future<List?>fetch() async{
     
 final resp =
        await http.get("http://10.0.2.2/database/store.php");
    
     if (resp.statusCode == 200) {
      setState(() {
        stores = json.decode(resp.body);
      });
    }   

}
Future <List?> remove() async{
    final response =
        await http.post("http://10.0.2.2/database/remove.php", body: {
      "Client_id":name[0]["Client_id"]
      
      
    });
     if (response.statusCode == 200) {
      setState(() {
        removed = json.decode(response.body);
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
      storeTab(context, data, stores, name),
      profilePage(context,authorized,name),
      Text('Tab3'),
      Text('Tab4'),
      Text('Tab5'),
    ];

    return Scaffold(
        backgroundColor: bgColor,
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
          title: Text('Sirius',
              style: logoWhiteStyle, textAlign: TextAlign.center),
          actions: <Widget>[
          
          ],
        ),
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                title: Text(
                  'Stores',
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

Widget storeTab(BuildContext context, List data, List stores, List name) {
  // will pick it up from here
  // am to start another template
  
  List<Product> products = [ ];
 String image = "";
 
    List<Product> products2 = [ ];
for(int i=0; i<data.length; i++){
     
      if(data[i]["Prod_name"]=="Sandal"){
       image="images/sandal.jpeg";
     }
     else if(data[i]["Prod_name"]=="Sneakers"){
       image="images/sneakers.jpg";
     }
     else if(data[i]["Prod_name"]=="Casual Shoes"){
       image = "images/casual.jpg";
     }
     else if(data[i]["Prod_name"]=="Classical Shoes"){
       image = "images/classicalshoes.jpg";
     }
     else if(data[i]["Prod_name"]=="Heeled Shoes"){
       image = "images/hs.jpg";
     }
     else if(data[i]["Prod_name"]=="Shoulde Bag"){
       image = "images/shoulderbag2.jpg";
     }
     else if(data[i]["Prod_name"]=="Sport Bag"){
       image = "images/sportbag.jpg";
     }
     else if(data[i]["Prod_name"]=="Backpack"){
       image = "images/backpag.jpg";
     }
     else if(data[i]["Prod_name"]=="Clutch"){
       image = "images/clutch.jpg";
     }
     else if(data[i]["Prod_name"]=="Wallet"){
       image = "images/wallet.jpg";
     }
     else if(data[i]["Prod_name"]=="Watch"){
       image = "images/watch.jpg";
     }
     else if(data[i]["Prod_name"]=="Sun Glasses"){
       image = "images/sunglasses.jpg";
     }
     else if(data[i]["Prod_name"]=="Necklace"){
       image = "images/necklake.png";
     }
     else if(data[i]["Prod_name"]=="Ring"){
       image = "images/ring.jpg";
     }
     else if(data[i]["Prod_name"]=="Earring"){
       image = "images/earing.jpg";
     }
     else if(data[i]["Prod_name"]=="Bracelet"){
       image = "images/bracelet.jpg";
     }
   
     products.add(new Product(
      name: data[i]["Prod_name"],
      image: image,
      price: data[i]["Price"]+" ₺",
      color: data[i]["Color"],
      size: data[i]["Size"],
      userLiked: true,
    ));
 
   
  
     products2.add(new Product(
      name: data[i]["Prod_name"],
      image: image,
      price: data[i]["Price"]+" ₺",
      color: data[i]["Color"],
      size: data[i]["Size"],
      userLiked: false,
    ));
    i=i+5;
}
 
    


  
  return ListView(children: <Widget>[
    headerTopCategories(context, stores, name ),
    deals('The most new products', onViewMore: () {}, items: <Widget>[
      for(var i in products)
        productItem(
        i,
        onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: i,
                  pageTitle: 'FProduct0',
                  name: name,
                );
              },
            ),
          );
        },
        onLike: () {},
        imgWidth: 110,
      ),
    ]),
    deals('The most popular products', onViewMore: () {}, items: <Widget>[
      for(var i in products2)
        productItem(i, onTapped: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return new ProductPage(
                productData: i,
                pageTitle: 'Product0',
                name: name,
              );
            },
          ),
        );
      }, onLike: () {}, imgWidth: 60),
      
    ])
  ]);
}

Widget sectionHeader(String headerTitle, {onViewMore}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 15, top: 10),
        child: Text(headerTitle, style: h4),
      ),
      Container(
        margin: EdgeInsets.only(left: 15, top: 2),
        child: FlatButton(
          onPressed: onViewMore,
          child: Text('View all ›', style: contrastText),
        ),
      )
    ],
  );
}

List<String> getStoreNames(List stores) {
 List<String> StoreNames= [];
 for(int i=0; i<stores.length; i++){
   StoreNames.add(stores[i]["Store_name"]);
 }
  return StoreNames;
}

// wrap the horizontal listview inside a sizedBox..
Widget headerTopCategories(BuildContext context, List stores, List name ) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      sectionHeader('Stores', onViewMore: () {}),
      SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            for(var i in getStoreNames(stores))
              headerCategoryItem(i, Icons.store_mall_directory,
                onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: ProductsOfStore(i, name)));
            }),
          ],
        ),
      )
    ],
  );
}

Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 86,
            height: 86,
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: name,
              onPressed: onPressed,
              backgroundColor: white,
              child: Icon(icon, size: 35, color: Colors.black87),
            )),
        Text(name + ' ›', style: categoryText)
      ],
    ),
  );
}

Widget deals(String dealTitle, {onViewMore, required List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            // ignore: unnecessary_null_comparison
            children: (items != null)
                ? items
                : <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('No items available at this moment.',
                          style: taglineText),
                    )
                  ],
          ),
        )
      ],
    ),
  );
}

Widget profilePage(BuildContext context, bool authorized, List list) {
  String type= "";
  int index = 0;
  if(authorized){
    type= "Employee";
  }
  else{
    type="Client";
    
  }

   return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
                              
        },
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.edit
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.grey,Colors.green],)),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex:5,
                child:Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.grey,Colors.blueGrey],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 50.0,),
                      CircleAvatar(
                        radius: 65.0,
                        backgroundImage: AssetImage('images/avatar.png'),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: 10.0,),
                      Text( list[index]["Name"]??list[index]["Mail"],
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0,
                      )),
                      SizedBox(height: 10.0,),
                      Text("Profile",
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 15.0,
                      ),)
                  ]
                  ),
                ),
              ),

              Expanded(
                flex:5,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                      child:Card(
                          margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.height*0.5,
                          height:MediaQuery.of(context).size.height*0.3,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Information",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w800,
                                ),),
                                Divider(color: Colors.grey[300],),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: Colors.blueAccent[400],
                                      size: 35,
                                    ),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Authorized",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text(type=="Client"? "No" : "Yes",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.auto_awesome,
                                      color: Colors.yellowAccent[400],
                                      size: 35,
                                    ),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Mail",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text(list[index]["Mail"]??"default",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                          ),)
                                      ],
                                    )

                                  ],
                                ),



                              ],
                            ),
                          )
                        )
                      )
                    ),
                  ),
              ),

            ],
          ),
          Positioned(
              top:MediaQuery.of(context).size.height*0.35,
              left: 20.0,
              right: 20.0,
              child: Card(
                child: Padding(
                  padding:EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child:Column(
                          children: [
                            Text('Type',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14.0
                            ),),
                            SizedBox(height: 5.0,),
                            Text(type,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),)
                          ],
                        )
                      ),

                      Container(
                        child: Column(
                        children: [
                          Text('ID',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14.0
                            ),),
                          SizedBox(height: 5.0,),
                          Text(list[index]["Client_id"]==null?list[index]["Person_id"]:list[index]["Client_id"]??"default",
                            style: TextStyle(
                              fontSize: 15.0,
                            ),)
                        ]),
                      ),

                      Container(
                          child:Column(
                            children: [
                              Text('Age',
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14.0
                                ),),
                              SizedBox(height: 5.0,),
                              Text(list[index]["Age"]==null?"Not given":list[index]["Client_id"]??"default",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),)
                            ],
                          )
                      ),
                    ],
                  ),
                )
              )
          )
        ],

      ),
    );
}

