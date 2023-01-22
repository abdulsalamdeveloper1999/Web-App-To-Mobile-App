import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/reusable_widgets/text_widget.dart';

import '../screens/cart_screen.dart';
import '../screens/home_screen.dart';

class AppBarWidget extends StatefulWidget {
  AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var sp = MediaQuery.textScaleFactorOf(context);
    var h = MediaQuery.of(context).size.height;
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: MediaQuery.of(context).size.height * 0.08,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: Container(
        // width: w - 10,

        padding: EdgeInsets.only(right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                _key.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu),
            ),
            Image.asset('assets/images/logo.png', height: 25),
            GestureDetector(
              onTap: () {
                //TODO
                LoginAlertBox(context);
              },
              child: MyText(
                'Login',
                color: Colors.black,
                size: 16 * sp,
                weight: FontWeight.bold,
              ),
            ),

            GestureDetector(
              onTap: () {
                SignUpAlertBox(context);
              },
              child: MyText(
                'Signup',
                color: Colors.black,
                size: 16 * sp,
                weight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.search_sharp,
              color: Colors.black,
              size: 18,
            ),
            // SizedBox(width: 15),

            Badge(
              badgeColor: Colors.black,
              badgeContent: MyText(
                '9',
                size: 9 * sp,
                color: Colors.white,
              ),
              child: Icon(
                Icons.favorite_outline,
                color: Colors.black,
                size: 18,
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
              child: Badge(
                badgeColor: Colors.black,
                badgeContent: MyText(
                  '9',
                  size: 9 * sp,
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            )
          ],
        ),
      ),
      bottom: TabBar(
        isScrollable: true,
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16 * sp,
          fontFamily: 'Poppins',
        ),
        labelColor: Colors.black,
        indicatorColor: Color(0xff0E4A99),
        controller: _tabController,
        tabs: [
          Tab(text: 'MAN'),
          Tab(text: 'WOMEN'),
          Tab(text: 'KIDS'),
          Tab(text: 'ACCESSORIES'),
        ],
      ),
    );
  }
}
