import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  final String name = "Ajmed";
  final String image = "assets/images/black.png";
  // CheckOut(this.name, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_sharp)),
        centerTitle: true,
        title: Text("CheckOut"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(3),
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
                        Text(
                          "Quantity",
                          style: TextStyle(fontSize: 15),
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
                        Text(
                          "Quantity",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "\$ 20.0",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discount",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "\$ 20.0",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shopping",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "\$ 20.0",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "\$ 20.0",
                    style: TextStyle(fontSize: 15),
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
