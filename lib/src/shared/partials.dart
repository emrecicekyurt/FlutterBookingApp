import 'package:flutter/material.dart';
import 'package:sirius/src/screens/ProductPage.dart';
import 'package:sirius/src/screens/ProductPageUpdate.dart';
import '../shared/Product.dart';
import '../shared/colors.dart';
import '../shared/styles.dart';

Widget productItem(Product product,
    {required double imgWidth, onLike, onTapped, bool isProductPage = false}) {
  return Container(
    width: 180,
    height: 180,
    margin: EdgeInsets.only(left: 20),
    child: Stack(
      children: <Widget>[
        Container(
            width: 180,
            height: 180,
            child: RaisedButton(
                color: white,
                elevation: (isProductPage) ? 20 : 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: onTapped,
                child: Hero(
                    transitionOnUserGestures: true,
                    tag: product.name,
                    child: Image.asset(product.image,
                        width: (imgWidth != null) ? imgWidth : 100)))),
        Positioned(
          bottom: (isProductPage) ? 10 : 70,
          right: 0,
          child: FlatButton(
            padding: EdgeInsets.all(20),
            shape: CircleBorder(),
            onPressed:onLike,
            child: Icon(
              (product.userLiked) ? Icons.favorite : Icons.favorite_border,
              color: (product.userLiked) ? primaryColor : darkText,
              size: 30,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product.name, style: foodNameText),
                    Text(product.price, style: priceText),
                  ],
                )
              : Text(' '),
        ),
      ],
    ),
  );
}

Widget productItemforStoresLeft(
    Product product,  BuildContext context, List name,
    {required double imgWidth, onLike, onTapped, bool isProductPage = false}) {
  return Container(
    width: 180,
    height: 180,
    margin: EdgeInsets.only(left: 20),
    child: Stack(
      children: <Widget>[
            Container(
                width: 180,
                height: 180,
                child: RaisedButton(
                    color: white,
                    elevation: (isProductPage) ? 20 : 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return new ProductPage(
                              productData: product,
                              pageTitle: 'FProduct1',
                              name: name,
                            );
                          },
                        ),
                      );
                    },
                    child: Hero(
                        transitionOnUserGestures: true,
                        tag:Text("btn2"),
                        child: Image.asset(product.image,
                            width: (imgWidth != null) ? imgWidth : 100)))
                            ,),
            SizedBox(
              width: 15,
            ),
           
        
        Positioned(
          bottom: 0,
          left: 0,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product.name, style: foodNameText),
                    Text(product.price, style: priceText),
                  ],
                )
              : Text(' '),
        ),
        
      ],
    ),
  );
}
Widget productItemforStoresRight(
    Product product2,  BuildContext context, List name,
    {required double imgWidth, onLike, onTapped, bool isProductPage = false}) {
  return Container(
    width: 180,
    height: 180,
    margin: EdgeInsets.only(right: 20),
    child: Stack(
      children: <Widget>[
             Align(
               alignment: Alignment.topRight,
               child:  Container(
                      width: 180,
                      height: 180,
                      child: RaisedButton(
                          color: white,
                          elevation: (isProductPage) ? 20 : 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return new ProductPage(
                                    productData: product2,
                                    pageTitle: 'FProduct1',
                                    name: name,
                                  );
                                },
                              ),
                            );
                          },
                          child: Hero(
                              transitionOnUserGestures: true,
                              tag: Text("btn2"),
                              child: Image.asset(product2.image,
                                  width: (imgWidth != null) ? imgWidth : 100)))),
               
             ),
         
            Positioned(
          bottom: 0,
          right: 0,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product2.name, style: foodNameText),
                    Text(product2.price, style: priceText),
                  ],
                )
              : Text(' '),
          ),
      ]
    ),
  );
}
Widget productItemforStoresLeftUpdate(
    Product product,  BuildContext context, List name,
    {required double imgWidth, onLike, onTapped, bool isProductPage = false}) {
  return Container(
    width: 180,
    height: 180,
    margin: EdgeInsets.only(left: 20),
    child: Stack(
      children: <Widget>[
            Container(
                width: 180,
                height: 180,
                child: RaisedButton(
                    color: white,
                    elevation: (isProductPage) ? 20 : 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return new ProductPageUpdate(
                              productData: product,
                              pageTitle: 'FProduct1',
                              name: name,
                            );
                          },
                        ),
                      );
                    },
                    child: Hero(
                        transitionOnUserGestures: true,
                        tag:Text("btn2"),
                        child: Image.asset(product.image,
                            width: (imgWidth != null) ? imgWidth : 100)))
                            ,),
            SizedBox(
              width: 15,
            ),
           
        
        Positioned(
          bottom: 0,
          left: 0,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product.name, style: foodNameText),
                    Text(product.price, style: priceText),
                  ],
                )
              : Text(' '),
        ),
        
      ],
    ),
  );
}
Widget productItemforStoresRightUpdate(
    Product product2,  BuildContext context, List name,
    {required double imgWidth, onLike, onTapped, bool isProductPage = false}) {
  return Container(
    width: 180,
    height: 180,
    margin: EdgeInsets.only(right: 20),
    child: Stack(
      children: <Widget>[
             Align(
               alignment: Alignment.topRight,
               child:  Container(
                      width: 180,
                      height: 180,
                      child: RaisedButton(
                          color: white,
                          elevation: (isProductPage) ? 20 : 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return new ProductPageUpdate(
                                    productData: product2,
                                    pageTitle: 'FProduct1',
                                    name: name,
                                  );
                                },
                              ),
                            );
                          },
                          child: Hero(
                              transitionOnUserGestures: true,
                              tag: Text("btn2"),
                              child: Image.asset(product2.image,
                                  width: (imgWidth != null) ? imgWidth : 100)))),
               
             ),
         
            Positioned(
          bottom: 0,
          right: 0,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product2.name, style: foodNameText),
                    Text(product2.price, style: priceText),
                  ],
                )
              : Text(' '),
          ),
      ]
    ),
  );
}


Widget productItemforUpdate(
    Product product, Product product2, BuildContext context, List name,
    {required double imgWidth, onLike, onTapped, bool isProductPage = false}) {
  return Container(
    width: 180,
    height: 180,
    margin: EdgeInsets.only(left: 20),
    child: Stack(
      children: <Widget>[
        Row(
          children: [
            Container(
                width: 180,
                height: 180,
                child: RaisedButton(
                    color: white,
                    elevation: (isProductPage) ? 20 : 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return new ProductPageUpdate(
                              productData: product,
                              pageTitle: 'FProduct1',
                              name: name,
                            );
                          },
                        ),
                      );
                    },
                    child: Hero(
                        transitionOnUserGestures: true,
                        tag:Text("btnn1"),
                        child: Image.asset(product.image,
                            width: (imgWidth != null) ? imgWidth : 100)))),
            SizedBox(
              width: 15,
            ),
            Container(
                width: 180,
                height: 180,
                child: RaisedButton(
                    color: white,
                    elevation: (isProductPage) ? 20 : 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return new ProductPageUpdate(
                              productData: product2,
                              pageTitle: 'FProduct2',
                              name: name,
                            );
                          },
                        ),
                      );
                    },
                    child: Hero(
                        transitionOnUserGestures: true,
                        tag: Text("btnn2"),
                        child: Image.asset(product2.image,
                            width: (imgWidth != null) ? imgWidth : 100))))
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product.name, style: foodNameText),
                    Text(product.price, style: priceText),
                  ],
                )
              : Text(' '),
        ),
        Positioned(
          bottom: 0,
          right: 25,
          child: (!isProductPage)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product2.name, style: foodNameText),
                    Text(product2.price, style: priceText),
                  ],
                )
              : Text(' '),
        ),
      ],
    ),
  );
}