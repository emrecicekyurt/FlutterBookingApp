import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sirius/src/screens/Dashboard.dart';
import 'package:sirius/src/shared/Product.dart';
import 'package:sirius/src/shared/partials.dart';
import 'package:sirius/src/shared/styles.dart';
import 'package:http/http.dart' as http;

import 'LoginPage.dart';
import 'ProductPage.dart';

class ProductsOfStore extends StatefulWidget {
  ProductsOfStore(this.storeName, this.name);
  final String storeName;
final List name;
  @override
  _ProductsOfStoreState createState() => _ProductsOfStoreState(storeName, name);
}

class _ProductsOfStoreState extends State<ProductsOfStore> {
  int _selectedIndex = 0;
  final String storeName;

  _ProductsOfStoreState(this.storeName, this.name);
  List data = [];
  List has = [];
 List name = [];
 List infoStore=[];
Future<List?>fetch() async{
      final response4 =
        await http.get("http://10.0.2.2/database/product.php");
    
     if (response4.statusCode == 200) {
      setState(() {
        data = json.decode(response4.body);
      });
    }
        final res =
        await http.post("http://10.0.2.2/database/has.php", body: {
      "Store_name": storeName,  
    });
    
     if (res.statusCode == 200) {
      setState(() {
        has = json.decode(res.body);
      });
    }
  final resp =
        await http.post("http://10.0.2.2/database/storeinfo.php", body: {
      "Store_name": storeName,  
    });
    
     if (resp.statusCode == 200) {
      setState(() {
        infoStore = json.decode(resp.body);
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
    print(infoStore);
 
   int counter=0;
    int index=0;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
            actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.info,
        color: Colors.white,
      ),
      onPressed: () {
        showDialog<String>(
          
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Supplier Information"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Store Name: "+ storeName, style: h6,),
              Text("Supplier Name: "+ infoStore[0]["Supplier_name"],style: h6,),
              Text("Country Name: "+ infoStore[0]["Country"],style: h6,),
              Text("City Name: "+ infoStore[0]["City"],style: h6,),

            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      },
    )
  ],
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: Dashboard(
                          pageTitle: "Dashboard", authorized: false, data: data, name: name, )));
            },
            iconSize: 21,
            icon: Icon(Icons.arrow_left),
          ),
          
          backgroundColor: Colors.amber[900],
          title: Text('Products of ' + storeName, textAlign: TextAlign.center),
        ),
        body: ListView(children: <Widget>[
          dealsColm('Here is the products', context,
              onViewMore: () {},
              items: <Widget>[
                Stack(children: <Widget>[
                  leftContainer(has, context, name),
                  rightContainer(has,context, name)
                ])
              ]),
              
        ]));
  }
}

Widget leftContainer(List<dynamic> list, BuildContext context, List name){
return Align(
  alignment: Alignment.topLeft,
  child:   Column(
  
  children: [for(var i in getProductsLeft(list))
  
                  productItemforStoresLeft(
  
                    i,
  
                    context,
                    name,
  
                    onLike: () {},
  
                    imgWidth: 110,
  
                  ),
  
  ],
  
  ),
);
}
Widget leftContainerUpdate(List<dynamic> list, BuildContext context, List name){
return Align(
  alignment: Alignment.topLeft,
  child:   Column(
  
  children: [for(var i in getProductsLeft(list))
  
                  productItemforStoresLeftUpdate(
  
                    i,
  
                    context,
                    name,
  
                    onLike: () {},
  
                    imgWidth: 110,
  
                  ),
  
  ],
  
  ),
);
}
Widget rightContainer(List<dynamic> list, BuildContext context, List name){
  return Align(
    alignment: Alignment.topRight,
    child: Column(
children: [for(var i in getProductsRight(list))
                  productItemforStoresRight(
                    i,
                    context,
                    name,
                    onLike: () {},
                    imgWidth: 110,
                  ),
],
),
  );
}
Widget rightContainerUpdate(List<dynamic> list, BuildContext context, List name){
  return Align(
    alignment: Alignment.topRight,
    child: Column(
children: [for(var i in getProductsRight(list))
                  productItemforStoresRightUpdate(
                    i,
                    context,
                    name,
                    onLike: () {},
                    imgWidth: 110,
                  ),
],
),
  );
}
List<Product> getProductsLeft(List has){
  List<Product> products = [ ];
 String image = "";

 for(int i=0; i<has.length; i++){
     if(has[i]["Prod_name"]=="Sandal"){
       image="images/sandal.jpeg";
     }
     else if(has[i]["Prod_name"]=="Sneakers"){
       image="images/sneakers.jpg";
     }
     else if(has[i]["Prod_name"]=="Casual Shoes"){
       image = "images/casual.jpg";
     }
     else if(has[i]["Prod_name"]=="Classical Shoes"){
       image = "images/classicalshoes.jpg";
     }
     else if(has[i]["Prod_name"]=="Heeled Shoes"){
       image = "images/hs.jpg";
     }
     else if(has[i]["Prod_name"]=="Shoulde Bag"){
       image = "images/shoulderbag2.jpg";
     }
     else if(has[i]["Prod_name"]=="Sport Bag"){
       image = "images/sportbag.jpg";
     }
     else if(has[i]["Prod_name"]=="Backpack"){
       image = "images/backpag.jpg";
     }
     else if(has[i]["Prod_name"]=="Clutch"){
       image = "images/clutch.jpg";
     }
     else if(has[i]["Prod_name"]=="Wallet"){
       image = "images/wallet.jpg";
     }
     else if(has[i]["Prod_name"]=="Watch"){
       image = "images/watch.jpg";
     }
     else if(has[i]["Prod_name"]=="Sun Glasses"){
       image = "images/sunglasses.jpg";
     }
     else if(has[i]["Prod_name"]=="Necklace"){
       image = "images/necklake.png";
     }
     else if(has[i]["Prod_name"]=="Ring"){
       image = "images/ring.jpg";
     }
     else if(has[i]["Prod_name"]=="Earring"){
       image = "images/earing.jpg";
     }
     else if(has[i]["Prod_name"]=="Bracelet"){
       image = "images/bracelet.jpg";
     }
   if(i%2==0)
     products.add(new Product(
      name: has[i]["Prod_name"],
      image: image,
      price: has[i]["Price"]+" ₺",
      color: has[i]["Color"],
      size: has[i]["Size"],
      userLiked: true,
    ));
   
    
 }

return products;
}
List<Product> getProductsRight(List has){
  List<Product> products = [ ];
 String image = "";

 for(int i=0; i<has.length; i++){
     if(has[i]["Prod_name"]=="Sandal"){
       image="images/sandal.jpeg";
     }
     else if(has[i]["Prod_name"]=="Sneakers"){
       image="images/sneakers.jpg";
     }
     else if(has[i]["Prod_name"]=="Casual Shoes"){
       image = "images/casual.jpg";
     }
     else if(has[i]["Prod_name"]=="Classical Shoes"){
       image = "images/classicalshoes.jpg";
     }
     else if(has[i]["Prod_name"]=="Heeled Shoes"){
       image = "images/hs.jpg";
     }
     else if(has[i]["Prod_name"]=="Shoulde Bag"){
       image = "images/shoulderbag2.jpg";
     }
     else if(has[i]["Prod_name"]=="Sport Bag"){
       image = "images/sportbag.jpg";
     }
     else if(has[i]["Prod_name"]=="Backpack"){
       image = "images/backpag.jpg";
     }
     else if(has[i]["Prod_name"]=="Clutch"){
       image = "images/clutch.jpg";
     }
     else if(has[i]["Prod_name"]=="Wallet"){
       image = "images/wallet.jpg";
     }
     else if(has[i]["Prod_name"]=="Watch"){
       image = "images/watch.jpg";
     }
     else if(has[i]["Prod_name"]=="Sun Glasses"){
       image = "images/sunglasses.jpg";
     }
     else if(has[i]["Prod_name"]=="Necklace"){
       image = "images/necklake.png";
     }
     else if(has[i]["Prod_name"]=="Ring"){
       image = "images/ring.jpg";
     }
     else if(has[i]["Prod_name"]=="Earring"){
       image = "images/earing.jpg";
     }
     else if(has[i]["Prod_name"]=="Bracelet"){
       image = "images/bracelet.jpg";
     }
   if(i%2==1)
     products.add(new Product(
      name: has[i]["Prod_name"],
      image: image,
      price: has[i]["Price"]+" ₺",
      color: has[i]["Color"],
      size: has[i]["Size"],
      userLiked: true,
    ));
   
    
 }

return products;
}

 
    

Widget dealsColm(String dealTitle, BuildContext context,
    {onViewMore, required List<Widget> items}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(dealTitle, onViewMore: onViewMore),
        Container(
          height: MediaQuery.of(context).size.height * 0.80,
          child: ListView(
            scrollDirection: Axis.vertical,
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
