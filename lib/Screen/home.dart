import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unvo/Screen/searchWidget.dart';
import 'package:unvo/details/details_screen.dart';
import 'package:unvo/model/Product.dart';

import '../constants.dart';
import 'checkoutPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController? _textEditingController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shadowColor: Colors.black12,
        backgroundColor: Colors.black,
        title: Row(
          // create a row
          children: <Widget>[
            Container(
              width: 220,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextField(
                onTap: () => Navigator.push(context,
                    CupertinoPageRoute(builder: (_) => SearchScreen())),
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
            ),

            SizedBox(
              width: 10,
            ),
            Container(
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/add_to_cart.svg",
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage()),
                  );
                },
              ),
            ),
            //buildSearch(),
          ],
        ),
        //  centerTitle: true
        elevation: 10.0, //and it elevation is 10.0
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
            Divider(),
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
                  itemCount: products.length,
                  itemBuilder: (Context, index) {
                    return buildCard(product: products[index]);
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
                onPressed: () {},
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
                onPressed: () {},
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

  Widget buildCard({
    required Product product,
  }) =>
      Column(
        children: [
          Container(
            child: Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Ink.image(
                  image: AssetImage(product.image),
                  // image: NetworkImage(product.image),
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
          ),
        ],
      );
}
