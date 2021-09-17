import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  final String name;
  final String image;
  Cart(this.name, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_sharp)),
        centerTitle: true,
        title: Text("Cart"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(3),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: InkWell(
            onTap: () {},
            child: Text(
              "Continue",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 0.8,
              child: Row(
                children: [
                  Container(
                    child: Card(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 1,
                      child: Image.asset(
                        "$image",
                        width: MediaQuery.of(context).size.width * 0.30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$name",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Clothes",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "\$ 30.0",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.cyan,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.remove,
                                  size: 18,
                                ),
                              ),
                              Text(
                                "1",
                                style: TextStyle(fontSize: 17),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 0.8,
              child: Row(
                children: [
                  Container(
                    child: Card(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 1,
                      child: Image.asset(
                        "$image",
                        width: MediaQuery.of(context).size.width * 0.30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$name",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Clothes",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "\$ 30.0",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.cyan,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.remove,
                                  size: 18,
                                ),
                              ),
                              Text(
                                "1",
                                style: TextStyle(fontSize: 17),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 0.8,
              child: Row(
                children: [
                  Container(
                    child: Card(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 1,
                      child: Image.asset(
                        "$image",
                        width: MediaQuery.of(context).size.width * 0.30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$name",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Clothes",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "\$ 30.0",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.cyan,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.remove,
                                  size: 18,
                                ),
                              ),
                              Text(
                                "1",
                                style: TextStyle(fontSize: 17),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 0.8,
              child: Row(
                children: [
                  Container(
                    child: Card(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 1,
                      child: Image.asset(
                        "$image",
                        width: MediaQuery.of(context).size.width * 0.30,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$name",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Clothes",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "\$ 30.0",
                          style: TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.cyan,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.remove,
                                  size: 18,
                                ),
                              ),
                              Text(
                                "1",
                                style: TextStyle(fontSize: 17),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
