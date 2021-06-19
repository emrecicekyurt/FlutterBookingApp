import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../shared/Product.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/partials.dart';
import '../shared/buttons.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  final String pageTitle;
  final Product productData;
  final List name;

  ProductPage({required this.pageTitle, required this.productData, required this.name});

  @override
  _ProductPageState createState() => _ProductPageState(name);
}

 
class _ProductPageState extends State<ProductPage> {
  _ProductPageState(this.name);
  List name = [];
  List product = [];
  List responseBook = [];
  int price =0;
  Future<List?>fetch() async{
       final response4 =
        await http.post("http://10.0.2.2/database/singleproduct.php", body: {
        "Color":widget.productData.color,
        "Size": widget.productData.size,
        "Prod_name": widget.productData.name,
        "Price": widget.productData.price
    });
    
     if (response4.statusCode == 200) {
      setState(() {
        product = json.decode(response4.body);
      });
    }
  
}
Future book()async{
  var one = int.parse(product[0]["Price"]);
  price=one*_quantity;
  final response = await http.post("http://10.0.2.2/database/book.php", body: {
     "Client_id":name[0]["Client_id"],
     "Product_id": product[0]["Prod_id"],
     "Store_id": product[0]["Store_id"],
     "Reservation_duration":day.toString(),
     "Total_price":price.toString()
    });
    
    String jsonsDataString = response.body.toString();
      var datauser = json.decode(jsonsDataString);
    if(datauser =="Error"){
      Fluttertoast.showToast(
        msg: "Item is not available",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );}
    else{
      Fluttertoast.showToast(
        msg: "Booking Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );}
}
@override
  void initState() {

    super.initState();
    fetch();
  }
   
  double _rating = 4;
  int _quantity = 1;
  int day = 0;
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  @override
  Widget build(BuildContext context) {
    print(product);
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgColor,
          centerTitle: true,
          leading: BackButton(
            color: darkText,
          ),
          title: Text(widget.productData.name, style: h4),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top: 100, bottom: 100),
                        padding: EdgeInsets.only(top: 100, bottom: 50),
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(widget.productData.name, style: h5),
                            Text(widget.productData.price, style: h3),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 20),
                              child: SmoothStarRating(
                                allowHalfRating: false,
                                onRatingChanged: (v) {
                                  setState(() {
                                    _rating = v;
                                  });
                                },
                                starCount: 5,
                                rating: _rating,
                                size: 27.0,
                                color: Colors.orange,
                                borderColor: Colors.orange,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 25),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Size: ${widget.productData.size} \nColor: ${widget.productData.color}",
                                      style: h6,
                                    ),
                                  ),
                                  Container(
                                    child: Text('Quantity', style: h6),
                                    margin: EdgeInsets.only(bottom: 15),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 55,
                                        height: 55,
                                        child: OutlineButton(
                                          onPressed: () {
                                            setState(() {
                                              _quantity += 1;
                                            });
                                          },
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(_quantity.toString(),
                                            style: h3),
                                      ),
                                      Container(
                                        width: 55,
                                        height: 55,
                                        child: OutlineButton(
                                          onPressed: () {
                                            setState(() {
                                              if (_quantity == 1) return;
                                              _quantity -= 1;
                                            });
                                          },
                                          child: Icon(Icons.remove),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 180,
                              child: froyoOutlineBtn('Book Now', () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(2018, 3, 5),
                                    maxTime: DateTime(2022, 6, 7),
                                    onChanged: (date) {
                                  print('change $date');
                                }, onConfirm: (date) {
                                  print('confirm $date');
                                  var current = DateTime.now();
                                  day = daysBetween(current, date);
                                  if (day > 15) {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Warning'),
                                        content: const Text(
                                            'The day for reserving cannot be more than 15!'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  else{
                                    book();
                                  }
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              }),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 15,
                                  spreadRadius: 5,
                                  color: Color.fromRGBO(0, 0, 0, .05))
                            ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 200,
                        height: 160,
                        child: productItem(widget.productData,
                            isProductPage: true,
                            onTapped: () {},
                            imgWidth: 250,
                            onLike: () {}),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
