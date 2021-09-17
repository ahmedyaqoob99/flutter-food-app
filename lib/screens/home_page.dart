import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_app_firebase/screens/login_page.dart';

import 'details.dart';

class HomePage extends StatelessWidget {
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    return LoginPage();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.jpg',
      'assets/images/5.jpg',
      'assets/images/6.jpg'
    ];

    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: [
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .toList();

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                child: FutureBuilder<DocumentSnapshot>(
                  future:
                      users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return UserAccountsDrawerHeader(
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/user.jpg"),
                        ),
                        accountName: Text(data['name']),
                        accountEmail: Text(data['email']),
                      );
                    }
                    return Text("loading");
                  },
                ),
              ),
              ListTile(
                selected: true,
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text("Shopping"),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("About"),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Contact Us"),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: GestureDetector(
                  onTap: signOut,
                  child: Text("Logout"),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ecommerce App"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: imgList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(imgList[index]),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Feature",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "/productList"),
                    child: Container(
                      child: Text("See All",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.23,
              margin: EdgeInsets.all(20),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 1,
                shrinkWrap: true,
                childAspectRatio: 1,
                scrollDirection: Axis.vertical,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: imgList.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Details(
                                "${imgList[index]}", "${imgList[index]}"),
                          ),
                        ),
                        child: Hero(
                          tag: "${imgList[index]}",
                          child: Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "${imgList[index]}",
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Image ${imgList[index]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("Arrival",
            //           style: TextStyle(fontWeight: FontWeight.bold)),
            //       Text("See All",
            //           style: TextStyle(fontWeight: FontWeight.bold)),
            //     ],
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.all(20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Card(
            //         child: Column(
            //           children: [
            //             Image.network(
            //               "https://i.pinimg.com/originals/bd/ef/cb/bdefcbc72735f64db17f3250b1e64245.png",
            //               width: MediaQuery.of(context).size.width * 0.40,
            //             ),
            //             SizedBox(height: 20),
            //             Text(
            //               "Men's T-shirt",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, fontSize: 18),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Card(
            //         child: Column(
            //           children: [
            //             Image.network(
            //               "https://i.pinimg.com/originals/62/98/b0/6298b026a65cf80bcf9dce061e9b79c9.png",
            //               width: MediaQuery.of(context).size.width * 0.40,
            //             ),
            //             SizedBox(height: 20),
            //             Text(
            //               "Men's T-shirt",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, fontSize: 18),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
