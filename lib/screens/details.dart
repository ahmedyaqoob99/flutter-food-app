import 'package:flutter/material.dart';

import 'carts.dart';

class Details extends StatefulWidget {
  final String name;
  final String image;
  Details(this.name, this.image);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_sharp)),
        centerTitle: true,
        title: Text("Detail"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Hero(
                  tag: "${widget.name}",
                  child: Card(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 1,
                    child: Image.asset(
                      "${widget.image}",
                      width: MediaQuery.of(context).size.width * 0.60,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.name}",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "\$ 30.0",
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Size",
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "S",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "M",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "L",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "XL",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Color",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        color: Colors.black,
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Quantity",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.cyan,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (count > 1) count -= 1;
                            });
                          },
                          child: Icon(Icons.remove),
                        ),
                        Text(
                          "$count",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              count += 1;
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Cart(
                                  "Men's T-shirt", "assets/images/orange.png"),
                            ),
                          );
                        },
                        child: Text(
                          "Checkout",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
