import 'package:flutter/material.dart';
import 'package:unvo/Screen/DesignerPage.dart';
import 'package:unvo/Screen/home.dart';
import 'Product.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({Key? key}) : super(key: key);

  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (context, _) => SizedBox(width: 8),
              itemBuilder: (context, index) {
                return buildCard(product: products[index]);
              })),
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
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
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
      Stack(children: <Widget>[
        Container(
          width: 410,
          height: 850,
          child: Column(children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Ink.image(
                  image: AssetImage(product.image),
                  // image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DesignerPage()),
                      );
                    },
                  ),
                ),
              ),
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                color: Colors.black,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/gucci.jpg',
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              Container(
                child: Text("Saraha Saffina",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ]);
}
