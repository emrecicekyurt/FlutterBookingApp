import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sirius/src/screens/Update.dart';
import 'package:sirius/src/screens/UpdateBody.dart';
import 'package:sirius/src/shared/inputFields.dart';
import '../shared/Product.dart';
import '../shared/styles.dart';
import '../shared/colors.dart';
import '../shared/partials.dart';
import '../shared/buttons.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ProductPageUpdate extends StatefulWidget {
  final String pageTitle;
  final Product productData;
  final List name;
  ProductPageUpdate(
      {required this.pageTitle, required this.productData, required this.name});

  @override
  _ProductPageUpdateState createState() => _ProductPageUpdateState(name);
}

class _ProductPageUpdateState extends State<ProductPageUpdate> {
  final sizeController = TextEditingController();
  final colorController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  double _rating = 4;
  int _quantity = 1;
  List product = [];
  List name = [];
  _ProductPageUpdateState(this.name);
  Future<List?> fetch() async {
    final response4 =
        await http.post("http://10.0.2.2/database/singleproduct.php", body: {
      "Color": widget.productData.color,
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

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future delete() async {
    final res = await http.post("http://10.0.2.2/database/delete.php",
        body: {"Prod_id": product[0]["Prod_id"]});
    String jsonsDataString = res.body.toString();
    print(jsonsDataString + "<<<<<<");
    var datauser = json.decode(jsonsDataString);
    if (datauser == "Error") {
      Fluttertoast.showToast(
          msg: "It is not removed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Removing is successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future update() async {
    final response =
        await http.post("http://10.0.2.2/database/update.php", body: {
      "Person_id": name[0]["Person_id"],
      "Prod_id": product[0]["Prod_id"],
      "Size": sizeController.text,
      "Quantity": quantityController.text,
      "Color": colorController.text,
      "Price": priceController.text
    });

    String jsonsDataString = response.body.toString();
    var datauser = json.decode(jsonsDataString);
    if (datauser == "Error") {
      Fluttertoast.showToast(
          msg: "Item is not available",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Updating Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(product[0]["Prod_id"]);
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
                            Text(
                              "Prod id :" + product[0]["Prod_id"],
                              style: h6,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 25),
                              child: Column(
                                children: <Widget>[
                                  siriusTextInput('Price', priceController),
                                  siriusTextInput('Size', sizeController),
                                  siriusTextInput('Color', colorController),
                                  siriusTextInput(
                                      'Quantitiy', quantityController),
                                ],
                              ),
                            ),
                            Container(
                              width: 180,
                              child: froyoOutlineBtn('Update Now', () {
                                update();
                              }),
                            ),
                            Container(
                              width: 180,
                              child: froyoOutlineBtn('Remove Product', () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Warning'),
                                    content: const Text(
                                        'You are about the remove the product. Are u sure?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          delete();
                                          int count = 0;
                                          Navigator.popUntil(context, (route) {
                                            return count++ == 2;
                                          });
                                        },
                                        child: const Text('YES'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'NO'),
                                        child: const Text('NO'),
                                      )
                                    ],
                                  ),
                                );
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
