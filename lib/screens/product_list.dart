import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_sharp)),
        centerTitle: true,
        title: Text("Product List"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Feature",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 0.5,
                scrollDirection: Axis.vertical,
                children: List.generate(10, (index) {
                  return Column(children: [
                    Card(
                      elevation: 1,
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/orange.png",
                            width: MediaQuery.of(context).size.width * 0.40,
                          ),
                          Text(
                            "Men's T-shirt",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 1,
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/black.png",
                            width: MediaQuery.of(context).size.width * 0.40,
                          ),
                          Text(
                            "Women's T-shirt",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
