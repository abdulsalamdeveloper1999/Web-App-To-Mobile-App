import 'package:badges/badges.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:web_app/reusable_widgets/text_widget.dart';
import 'package:web_app/screens/product_screen.dart';

import '../lists/list_holders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
    return SafeArea(
      child: Scaffold(
        key: _key,
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Container(
            // width: w - 10,
            padding: EdgeInsets.only(top: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _key.currentState!.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffEF7300),
                        ),
                        child: MyText(
                          'Logo!',
                          color: Colors.white,
                          size: 16 * sp,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: w * 0.05),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyText(
                          'Login',
                          color: Colors.black,
                          size: 16 * sp,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(width: 15),
                        MyText(
                          'Signup',
                          color: Colors.black,
                          size: 16 * sp,
                          weight: FontWeight.bold,
                        ),
                        Icon(
                          Icons.search_sharp,
                          color: Colors.black,
                        ),
                        SizedBox(width: 15),
                        Flexible(
                          child: Badge(
                            badgeColor: Colors.black,
                            badgeContent: MyText(
                              '9',
                              size: 12 * sp,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Badge(
                            badgeColor: Colors.black,
                            badgeContent: MyText(
                              '9',
                              size: 12 * sp,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
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
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _ManTabBarView(),
            Text('Content for tab 2'),
            Text('Content for tab 2'),
            Text('Content for tab 2'),
          ],
        ),
      ),
    );
  }
}

class _ManTabBarView extends StatelessWidget {
  const _ManTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var sp = MediaQuery.textScaleFactorOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: h * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffAD0030),
                  Color(0xffFF602E),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            // padding: EdgeInsets.only(left: 10),
            height: h * 0.2,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: imagesOne.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(10),
                    height: h * 0.1,
                    width: w / 4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffAD0030),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('${imagesOne[index]}'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  'FLASH SALE',
                  color: Color(0xff001D59),
                  weight: FontWeight.bold,
                  size: 20 * sp,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: MyText(
                        '0',
                        weight: FontWeight.bold,
                        size: 20 * sp,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: MyText(
                        '0',
                        weight: FontWeight.bold,
                        size: 20 * sp,
                      ),
                    ),
                    MyText(
                      ":",
                      weight: FontWeight.bold,
                      size: 20 * sp,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: MyText(
                        '0',
                        weight: FontWeight.bold,
                        size: 20 * sp,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: MyText(
                        '0',
                        weight: FontWeight.bold,
                        size: 20 * sp,
                      ),
                    ),
                    MyText(
                      ":",
                      weight: FontWeight.bold,
                      size: 20 * sp,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: MyText(
                        '0',
                        weight: FontWeight.bold,
                        size: 20 * sp,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: MyText(
                        '0',
                        weight: FontWeight.bold,
                        size: 20 * sp,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 20),
              height: h * 0.31,
              child: Row(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: ImagesTwo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: w * 0.35,
                        margin: EdgeInsets.only(right: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              '${ImagesTwo[index]}',
                              height: h * 0.18,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyText(
                                  '₹526',
                                  color: Color(0xffFA673C),
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(width: 10),
                                MyText(
                                  '₹152',
                                  color: Colors.grey,
                                  weight: FontWeight.bold,
                                  textDeco: TextDecoration.lineThrough,
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            LinearPercentIndicator(
                              padding: EdgeInsets.zero,
                              barRadius: Radius.circular(10),
                              width: w * 0.25,
                              lineHeight: 14.0,
                              percent: 0.5,
                              backgroundColor: Colors.grey.withOpacity(0.5),
                              progressColor: Color(0xffFFC107),
                            ),
                            SizedBox(height: 4),
                            MyText(
                              '20% Sold',
                              color: Colors.black,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: h * 0.11,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 5),
                    MyText(
                      'PREMIUM',
                      size: 20 * sp,
                      weight: FontWeight.bold,
                      color: Color(0xff36537A),
                    ),
                    MyText(
                      'QUALITY',
                      size: 18 * sp,
                      weight: FontWeight.bold,
                      color: Color(0xffDD302D),
                    ),
                    MyText(
                      'T-SHIRT',
                      size: 18 * sp,
                      weight: FontWeight.bold,
                      color: Color(0xff36537A),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: w * 0.25,
                  color: Color(0xff8E0000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        'Starting Only',
                        size: 16 * sp,
                        weight: FontWeight.w500,
                        color: Colors.white,
                        textAlign: TextAlign.center,
                      ),
                      MyText(
                        '₹249/-',
                        size: 18 * sp,
                        weight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  'POPULAR CATEGORIES',
                  color: Color(0xff001D59),
                  weight: FontWeight.bold,
                  size: 20 * sp,
                ),
                SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  // spacing: 3.0,
                  children: [
                    ...List.generate(
                        ImagesThree.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(
                                right: 8.0,
                                bottom: 10,
                                left: 8.0,
                              ),
                              child: Image.asset(
                                '${ImagesThree[index]}',
                                height: 100,
                              ),
                            ))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8, bottom: 10),
            child: Column(
              children: [
                MyText(
                  'OFFER ZONE',
                  color: Color(0xff001D59),
                  weight: FontWeight.bold,
                  size: 20 * sp,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    ...List.generate(
                      ImagesFour.length,
                      (index) => Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          height: h * 0.15,
                          width: w * 0.46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('${ImagesFour[index]}'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        ImagesFive.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Image.asset(
                            '${ImagesFive[index]}',
                            height: h * 0.2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ...List.generate(
                  ImagesSix.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      '${ImagesSix[index]}',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 20),
              height: h * 0.31,
              child: Row(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: ImagesSeven.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // width: w * 0.35,
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              '${ImagesSeven[index]}',
                              height: h * 0.2,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyText(
                                  '₹526',
                                  color: Color(0xffFA673C),
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(width: 10),
                                MyText(
                                  '₹152',
                                  color: Colors.grey,
                                  weight: FontWeight.bold,
                                  textDeco: TextDecoration.lineThrough,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  ImagesEight.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 10),
                    child: Image.asset(
                      '${ImagesEight[index]}',
                      height: h * 0.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            height: h * 0.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/freeGift.png'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8, bottom: 10),
            child: Column(
              children: [
                MyText(
                  'DAILY DROPS',
                  color: Color(0xff001D59),
                  weight: FontWeight.bold,
                  size: 20 * sp,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    ...List.generate(
                      ImagesNine.length,
                      (index) => Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          height: h * 0.18,
                          width: w * 0.46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('${ImagesNine[index]}'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8, bottom: 30),
            child: Column(
              children: [
                MyText(
                  '#campaigns',
                  color: Color(0xff001D59),
                  weight: FontWeight.bold,
                  size: 20 * sp,
                ),
                SizedBox(height: 10),
                Image.asset('assets/images/campaign.png'),
                SizedBox(height: 10),
                Image.asset('assets/images/exelentmember.png'),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                ...List.generate(
                  ImagesTen.length,
                  (index) => Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          '${ImagesTen[index]}',
                          height: 50,
                        ),
                        SizedBox(height: 10),
                        MyText(
                          '${ImagesTenNames[index]}',
                          size: 20 * sp,
                          weight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          color: Color(0xff181818),
                        ),
                        SizedBox(height: 10),
                        MyText(
                          '${ImagesTenDetails[index]}',
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
                      ImagesEleven.length,
                      (index) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            '${ImagesEleven[index]}',
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
                      ImagesTwelves.length,
                      (index) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          '${ImagesTwelves[index]}',
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
                SizedBox(
                  height: h * 0.5,
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: expandHeader.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ExpandablePanel(
                          header: MyText(
                            expandHeader[index],
                            weight: FontWeight.w500,
                          ),
                          collapsed: Text(''),
                          expanded: Text(
                            expandData[index],
                            softWrap: true,
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
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
    );
  }
}
