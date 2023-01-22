import 'package:badges/badges.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_app/screens/product_single_screen.dart';

import '../lists/list_holders.dart';
import '../reusable_widgets/text_widget.dart';
import 'cart_screen.dart';
import 'home_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
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
    var h = MediaQuery.of(context).size.height;
    var sp = MediaQuery.textScaleFactorOf(context);
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Container(
            // width: w - 10,

            padding: const EdgeInsets.only(right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _key.currentState!.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                    Image.asset('assets/images/logo.png', height: 25),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.search_sharp,
                      color: Colors.black,
                    ),
                    // SizedBox(width: 15),
                    SizedBox(width: 10),
                    Badge(
                      badgeColor: Colors.black,
                      badgeContent: MyText(
                        '9',
                        size: 9 * sp,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartScreen(),
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
                        child: const Icon(Icons.shopping_cart_outlined,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
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
            indicatorColor: const Color(0xff0E4A99),
            controller: _tabController,
            tabs: [
              const Tab(text: 'MAN'),
              const Tab(text: 'WOMEN'),
              const Tab(text: 'KIDS'),
              const Tab(text: 'ACCESSORIES'),
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: MyText(
                        'Welcome Guest',
                        size: 20 * sp,
                        weight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _key.currentState!.closeDrawer();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyText(
                          'Login',
                          size: 18 * sp,
                          weight: FontWeight.w300,
                        ),
                        MyText(
                          '/',
                          size: 18 * sp,
                          weight: FontWeight.w300,
                        ),
                        MyText(
                          'Sign up',
                          size: 18 * sp,
                          weight: FontWeight.w300,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      'MENU',
                      size: 20 * sp,
                      weight: FontWeight.bold,
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Man',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Women',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Accessories',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Customise products',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.withOpacity(0.2),
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      'PROFILE',
                      size: 20 * sp,
                      weight: FontWeight.bold,
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Profile',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Women',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Accessories',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Customise products',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _ProductView(),
            Text('Content for tab 2'),
            Text('Content for tab 2'),
            Text('Content for tab 2'),
          ],
        ),
      ),
    );
  }
}

class _ProductView extends StatelessWidget {
  const _ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight) / 1.69;
    final double itemWidth = size.width / 2;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var sp = MediaQuery.textScaleFactorOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Image.asset('assets/images/hearder.jpg'),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: (itemWidth / itemHeight),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: List.generate(
                      imagesThirteen.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductSingleScreen(),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child:
                                      Image.asset('${imagesThirteen[index]}')),
                              SizedBox(height: 10),
                              MyText(
                                'Bewakoof',
                                size: 16 * sp,
                                color: kdarkblue.withOpacity(0.7),
                                weight: FontWeight.bold,
                              ),
                              MyText(
                                'Customized Men\'s White Round Neck T-Shirt',
                                size: 10 * sp,
                                color: Colors.black,
                                weight: FontWeight.w400,
                              ),
                              Row(
                                children: [
                                  MyText(
                                    '₹499',
                                    size: 16 * sp,
                                    color: kdarkblue.withOpacity(0.7),
                                    weight: FontWeight.bold,
                                  ),
                                  MyText(
                                    ' ₹830',
                                    textDeco: TextDecoration.lineThrough,
                                    size: 12 * sp,
                                    color: Colors.black,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 6),
                                padding: EdgeInsets.all(6),
                                color: Colors.black.withOpacity(0.1),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '499',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                          fontSize: 12 * sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' For Tribe Members',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          fontSize: 12 * sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Color(0xffF3F3F3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      ...List.generate(
                        imagesTen.length,
                        (index) => Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                '${imagesTen[index]}',
                                height: 50,
                              ),
                              SizedBox(height: 10),
                              MyText(
                                '${imagesTenNames[index]}',
                                size: 20 * sp,
                                weight: FontWeight.bold,
                                textAlign: TextAlign.center,
                                color: Color(0xff181818),
                              ),
                              SizedBox(height: 10),
                              MyText(
                                '${imagesTenDetails[index]}',
                                textAlign: TextAlign.center,
                                size: 18 * sp,
                                weight: FontWeight.w400,
                                color: Color(0xff181818),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Icon(
                        Icons.lock_outline,
                        size: 40,
                      ),
                      MyText(
                        'SECURE PAYMENTS',
                        size: 20 * sp,
                        weight: FontWeight.bold,
                        color: Color(0xff181818),
                      ),
                      MyText(
                        '100% Assurance',
                        size: 16 * sp,
                        weight: FontWeight.w400,
                        color: Color(0xff181818),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Color(0xff181818),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 50,
                      ),
                      SizedBox(height: 10),
                      //Heading
                      MyText(
                        'CUSTOMER SERVICE',
                        size: 20 * sp,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      //Categories
                      ...List.generate(
                        customerService.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: MyText(
                            customerService[index],
                            size: 18 * sp,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //Heading
                      MyText(
                        'COMPANY INFO',
                        size: 20 * sp,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      //Categories
                      ...List.generate(
                        companyInfo.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: MyText(
                            companyInfo[index],
                            size: 18 * sp,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //Heading
                      MyText(
                        'HELP & SUPPORT',
                        size: 20 * sp,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      //Categories
                      ...List.generate(
                        helpAndSupport.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: MyText(
                            helpAndSupport[index],
                            size: 18 * sp,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Heading
                      MyText(
                        'JOIN US FOR GET UPDATES',
                        size: 20 * sp,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            height: 55,
                            width: w * 0.4,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 55,
                            width: w * 0.45,
                            color: Colors.black,
                            child: Center(
                              child: MyText(
                                'SUBSCRIBE',
                                size: 20 * sp,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      MyText(
                        'CONNECT WITH US',
                        size: 20 * sp,
                        weight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          ...List.generate(
                            svgsAssets.length,
                            (index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                '${svgsAssets[index]}',
                                height: 25,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      MyText(
                        'DOWNLOAD THE APP',
                        size: 20 * sp,
                        weight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          ...List.generate(
                            imagesEleven.length,
                            (index) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image.asset(
                                  '${imagesEleven[index]}',
                                  height: 50,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          MyText('100% SECURE PAYMENTS'),
                          ...List.generate(
                            imagesTwelves.length,
                            (index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                '${imagesTwelves[index]}',
                                height: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      ExpandablePanel(
                        header: MyText(
                          expandHeader[0],
                          weight: FontWeight.w500,
                        ),
                        collapsed: Text(''),
                        expanded: Text(
                          expandData[0],
                          softWrap: true,
                        ),
                      ),
                      Divider(),
                      ExpandablePanel(
                        header: MyText(
                          expandHeader[1],
                          weight: FontWeight.w500,
                        ),
                        collapsed: Text(''),
                        expanded: Text(
                          expandData[1],
                          softWrap: true,
                        ),
                      ),
                      Divider(),
                      ExpandablePanel(
                        header: MyText(
                          expandHeader[2],
                          weight: FontWeight.w500,
                        ),
                        collapsed: Text(''),
                        expanded: Text(
                          expandData[2],
                          softWrap: true,
                        ),
                      ),
                      Divider(),
                      MyText(
                        '©2022 All Rights Reserved',
                        weight: FontWeight.w500,
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
