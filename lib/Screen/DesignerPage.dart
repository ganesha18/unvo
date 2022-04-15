import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unvo/Screen/searchWidget.dart';
import 'package:unvo/details/details_screen.dart';
import 'package:unvo/model/Product.dart';

import 'home.dart';

class DesignerPage extends StatefulWidget {
  const DesignerPage({Key? key}) : super(key: key);

  @override
  _DesignerPageState createState() => _DesignerPageState();
}

class _DesignerPageState extends State<DesignerPage> {
  TextEditingController? _textEditingController = TextEditingController();
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "product-name": qn.docs[i]["product-name"],
          "product-description": qn.docs[i]["product-description"],
          "product-price": qn.docs[i]["product-price"],
          "product-img": qn.docs[i]["product-img"],
        });
      }
    });

    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shadowColor: Colors.black12,
        backgroundColor: Colors.black,
        title: Row(
          // create a row
          children: <Widget>[
            Container(
              width: 30,
              height: 50,
              child: Image.asset("assets/logo.jpeg"),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "UNVO",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 100,
            ),
          ],
        ),
        //  centerTitle: true,
        elevation: 10.0,
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                color: Colors.black,
                width: 40,
                height: 40,
                child: Image.asset("assets/logo.jpeg"),
              ),
            ),
            ListTile(
              leading: Container(
                child: Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              trailing: Icon(Icons.account_circle_rounded),
            ),
            Divider(
              color: Colors.white30,
            ),
            ListTile(
              leading: Container(
                child: Text('Email',
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
              trailing: Icon(Icons.email),
            ),
            Divider(),
            ListTile(
              leading: Container(
                child: Text('Admin',
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
              trailing: Icon(Icons.analytics_outlined),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            child: Column(children: [
              Row(children: [
                SizedBox(
                  height: 90,
                  width: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(150.0)),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/gucci.jpg'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                  width: 20,
                ),
                Column(children: [
                  Container(
                      //width: 20,
                      //height: 10,
                      child: Text(
                    'Gucci is an fashion house ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "1900",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ]),
              ]),
              SizedBox(
                height: 30,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10),
                  itemCount: _products.length,
                  itemBuilder: (Context, index) {
                    return Container(
                      width: 40,
                      height: 40,
                      child: Column(children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Ink.image(
                              //image: AssetImage(product.image),
                              //image: NetworkImage(product.image),
                              image: NetworkImage(
                                _products[index]["product-img"][0],
                              ),
                              fit: BoxFit.cover,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsScreen(
                                                product: _products[index],
                                              )));
                                },
                              ),
                            ),
                          ),
                        ),
                      ]),
                    );
                  }),
            ),
          ),
        ],
      )),
      bottomNavigationBar: new Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          //borderRadius: BorderRadius.circular(120.0)
        ),
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          //  mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: FlatButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                color: Colors.black,
                icon: Icon(Icons.home, color: Colors.white),
                label: Text(""),
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                color: Colors.black,
                height: 15,
                onPressed: () {},
                child: Image.asset('assets/logo.jpeg'),
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton.icon(
                color: Colors.black,
                onPressed: () {
                  Search();
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: Text(""),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Search() => Container(
        width: 220,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: TextField(
          onTap: () => Navigator.push(
              context, CupertinoPageRoute(builder: (_) => SearchScreen())),
          controller: _textEditingController,
          decoration: InputDecoration(
              fillColor: Colors.white,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(8),
              hintText: 'Search'),
        ),
      );

  Widget buildCard({
    required Product product,
  }) =>
      Container(
        width: 40,
        height: 40,
        child: Column(children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Ink.image(
                //image: AssetImage(product.image),
                image: NetworkImage(product.image),
                //image: NetworkImage(_products["product-img"][0],),
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  product: product,
                                )));
                  },
                ),
              ),
            ),
          ),
        ]),
      );
}
