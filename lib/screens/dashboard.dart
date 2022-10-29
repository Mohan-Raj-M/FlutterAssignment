import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import '../widgets/vegetable_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
  appBar: AppBar(
    title: const Text('Home'),
    backgroundColor: Color(0xff23AA49),
  ),
  body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 6,
            ),
           
            SizedBox(
              height: 16,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF3F5F7),
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Category",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Color(0xff979899),
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.all(16),
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: Color(0xff23AA49),
                        ),
                      )),
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/banner.png",
                scale: 4.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _seeAllView(context, "Categories"),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      _categoriesView("assets/images/fruits.png", "Fruits"),
                      _categoriesView(
                          "assets/images/vegetables.png", "Vegetables"),
                      _categoriesView("assets/images/diary.png", "Diary"),
                      _categoriesView("assets/images/meat.png", "Meat")
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  _seeAllView(context, "Best Selling"),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: VegetableCardWidget(
                          imagePath: "assets/images/bell_pepper_red.png",
                          name: "Bell Pepper Red",
                          price: "1kg, 4\$",
                          onTapCallback: () {
                            Navigator.pushNamed(
                                context, MyRoutes.vegetableDetailRoute);
                          },
                        ),
                      ),
                      Expanded(
                        child: VegetableCardWidget(
                            imagePath: "assets/images/lamb_meat.png",
                            name: "Bell Pepper Red",
                            price: "1kg, 4\$",
                            onTapCallback: () {}),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      
  drawer: Drawer(
    child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
              ),
              accountEmail: Text('swethar@kaartech.com'),
              accountName: Text(
                'Swetha R',
                style: TextStyle(fontSize: 24.0),
              ),
              decoration: BoxDecoration(
                color: Color(0xff23AA49),
              ),
            ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text('Cart'),
          onTap: () {
                Navigator.pushNamed(
                                context, MyRoutes.cartRoute);
                        
              },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
                Navigator.pushNamed(
                                context, MyRoutes.welcomeRoute);
                        
              },
        )
      ],
    ),
  ),

    );
  }

  Widget _seeAllView(BuildContext context, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.vegetablesRoute);
          },
          child: Text(
            "See All",
            style: TextStyle(
                fontSize: 14,
                color: Color(0xff23AA49),
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _categoriesView(String imagePath, String catName) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xffF3F5F7),
            radius: 32,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                imagePath,
                scale: 4.0,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            catName,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          )
        ],
      ),
    );
  }
}
