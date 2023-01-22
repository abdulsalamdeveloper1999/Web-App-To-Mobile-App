import 'package:badges/badges.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:web_app/reusable_widgets/text_widget.dart';
import 'package:web_app/screens/product_screen.dart';
import '../lists/list_holders.dart';
import 'cart_screen.dart';

GlobalKey<FormState> formkey = GlobalKey<FormState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
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
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      'MENU',
                      size: 20 * sp,
                      weight: FontWeight.bold,
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Man',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Women',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Accessories',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
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
                margin: const EdgeInsets.only(bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      'PROFILE',
                      size: 20 * sp,
                      weight: FontWeight.bold,
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Profile',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Women',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: MyText(
                        'Accessories',
                        size: 18 * sp,
                        weight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
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
        body: WillPopScope(
          onWillPop: () async {
            return onBackButtonPressed(context);
          },
          child: TabBarView(
            controller: _tabController,
            children: [
              const _ManTabBarView(),
              const Text('Content for tab 2'),
              const Text('Content for tab 2'),
              const Text('Content for tab 2'),
            ],
          ),
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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffAD0030),
                  Color(0xffFF602E),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
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
                        builder: (context) => const ProductScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(10),
                    height: h * 0.1,
                    width: w / 4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffAD0030),
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
          ///////////////////////////////////////////////////////////////////////////////////////////////
          ////////////////////////////////////////////
          ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  'FLASH SALE',
                  color: const Color(0xff001D59),
                  weight: FontWeight.bold,
                  size: 20 * sp,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
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
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      padding: const EdgeInsets.all(5),
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
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.all(5),
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
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      padding: const EdgeInsets.all(5),
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
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.all(5),
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
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.all(5),
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
              padding: const EdgeInsets.only(top: 10, left: 20),
              height: h * 0.31,
              child: Row(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: imagesTwo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: w * 0.35,
                        margin: const EdgeInsets.only(right: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                '${imagesTwo[index]}',
                                height: h * 0.18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyText(
                                  '₹526',
                                  color: const Color(0xffFA673C),
                                  weight: FontWeight.bold,
                                ),
                                const SizedBox(width: 10),
                                MyText(
                                  '₹152',
                                  color: Colors.grey,
                                  weight: FontWeight.bold,
                                  textDeco: TextDecoration.lineThrough,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            LinearPercentIndicator(
                              padding: EdgeInsets.zero,
                              barRadius: const Radius.circular(10),
                              width: w * 0.25,
                              lineHeight: 14.0,
                              percent: 0.5,
                              backgroundColor: Colors.grey.withOpacity(0.5),
                              progressColor: const Color(0xffFFC107),
                            ),
                            const SizedBox(height: 4),
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
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: h * 0.14,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 5),
                    MyText(
                      'PREMIUM',
                      size: 20 * sp,
                      weight: FontWeight.bold,
                      color: const Color(0xff36537A),
                    ),
                    MyText(
                      'QUALITY',
                      size: 18 * sp,
                      weight: FontWeight.bold,
                      color: const Color(0xffDD302D),
                    ),
                    MyText(
                      'T-SHIRT',
                      size: 18 * sp,
                      weight: FontWeight.bold,
                      color: const Color(0xff36537A),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: w * 0.25,
                  color: const Color(0xff8E0000),
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
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  'POPULAR CATEGORIES',
                  color: const Color(0xff001D59),
                  weight: FontWeight.bold,
                  size: 20 * sp,
                ),
                const SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  // spacing: 3.0,
                  children: [
                    ...List.generate(
                        imagesThree.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(
                                right: 8.0,
                                bottom: 10,
                                left: 8.0,
                              ),
                              child: Image.asset(
                                '${imagesThree[index]}',
                                height: 100,
                              ),
                            ))
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8, bottom: 10),
            child: Column(
              children: [
                MyText(
                  'OFFER ZONE',
                  color: const Color(0xff001D59),
                  weight: FontWeight.bold,
                  size: 20 * sp,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ...List.generate(
                      imagesFour.length,
                      (index) => Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: h * 0.15,
                          width: w * 0.46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('${imagesFour[index]}'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        imagesFive.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Image.asset(
                            '${imagesFive[index]}',
                            height: h * 0.2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ...List.generate(
                  imagesSix.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      '${imagesSix[index]}',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 20),
              height: h * 0.31,
              child: Row(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: imagesSeven.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // width: w * 0.35,
                        margin: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              '${imagesSeven[index]}',
                              height: h * 0.2,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyText(
                                  '₹526',
                                  color: const Color(0xffFA673C),
                                  weight: FontWeight.bold,
                                ),
                                const SizedBox(width: 10),
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
                  imagesEight.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 10),
                    child: Image.asset(
                      '${imagesEight[index]}',
                      height: h * 0.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: h * 0.1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/freeGift.png'),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8, bottom: 10),
            child: Column(
              children: [
                MyText(
                  'DAILY DROPS',
                  color: const Color(0xff001D59),
                  weight: FontWeight.bold,
                  size: 20 * sp,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ...List.generate(
                      imagesNine.length,
                      (index) => Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: h * 0.18,
                          width: w * 0.46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('${imagesNine[index]}'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 8, bottom: 30),
            child: Column(
              children: [
                MyText(
                  '#campaigns',
                  color: const Color(0xff001D59),
                  weight: FontWeight.bold,
                  size: 20 * sp,
                ),
                const SizedBox(height: 10),
                Image.asset('assets/images/campaign.png'),
                const SizedBox(height: 10),
                Image.asset('assets/images/exelentmember.png'),
              ],
            ),
          ),
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
                        const SizedBox(height: 10),
                        MyText(
                          '${imagesTenNames[index]}',
                          size: 20 * sp,
                          weight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          color: const Color(0xff181818),
                        ),
                        const SizedBox(height: 10),
                        MyText(
                          '${imagesTenDetails[index]}',
                          textAlign: TextAlign.center,
                          size: 18 * sp,
                          weight: FontWeight.w400,
                          color: const Color(0xff181818),
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
                const SizedBox(height: 10),
                const Icon(
                  Icons.lock_outline,
                  size: 40,
                ),
                MyText(
                  'SECURE PAYMENTS',
                  size: 20 * sp,
                  weight: FontWeight.bold,
                  color: const Color(0xff181818),
                ),
                MyText(
                  '100% Assurance',
                  size: 16 * sp,
                  weight: FontWeight.w400,
                  color: const Color(0xff181818),
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Color(0xff181818),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 50,
                ),
                const SizedBox(height: 10),
                //Heading
                MyText(
                  'CUSTOMER SERVICE',
                  size: 20 * sp,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                //Categories
                ...List.generate(
                  customerService.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyText(
                      customerService[index],
                      size: 18 * sp,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //Heading
                MyText(
                  'COMPANY INFO',
                  size: 20 * sp,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                //Categories
                ...List.generate(
                  companyInfo.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyText(
                      companyInfo[index],
                      size: 18 * sp,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //Heading
                MyText(
                  'HELP & SUPPORT',
                  size: 20 * sp,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                //Categories
                ...List.generate(
                  helpAndSupport.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
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
            margin: const EdgeInsets.only(
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
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      height: 55,
                      width: w * 0.4,
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
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
                const SizedBox(height: 10),
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
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          '${svgsAssets[index]}',
                          height: 25,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            '${imagesEleven[index]}',
                            height: 50,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    MyText('100% SECURE PAYMENTS'),
                    ...List.generate(
                      imagesTwelves.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
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
            color: const Color(0xffF3F3F3),
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
                              const SizedBox(height: 10),
                              MyText(
                                '${imagesTenNames[index]}',
                                size: 20 * sp,
                                weight: FontWeight.bold,
                                textAlign: TextAlign.center,
                                color: const Color(0xff181818),
                              ),
                              const SizedBox(height: 10),
                              MyText(
                                '${imagesTenDetails[index]}',
                                textAlign: TextAlign.center,
                                size: 18 * sp,
                                weight: FontWeight.w400,
                                color: const Color(0xff181818),
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
                      const SizedBox(height: 10),
                      const Icon(
                        Icons.lock_outline,
                        size: 40,
                      ),
                      MyText(
                        'SECURE PAYMENTS',
                        size: 20 * sp,
                        weight: FontWeight.bold,
                        color: const Color(0xff181818),
                      ),
                      MyText(
                        '100% Assurance',
                        size: 16 * sp,
                        weight: FontWeight.w400,
                        color: const Color(0xff181818),
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: Color(0xff181818),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 50,
                      ),
                      const SizedBox(height: 10),
                      //Heading
                      MyText(
                        'CUSTOMER SERVICE',
                        size: 20 * sp,
                        weight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      //Categories
                      ...List.generate(
                        customerService.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: MyText(
                            customerService[index],
                            size: 18 * sp,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //Heading
                      MyText(
                        'COMPANY INFO',
                        size: 20 * sp,
                        weight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      //Categories
                      ...List.generate(
                        companyInfo.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: MyText(
                            companyInfo[index],
                            size: 18 * sp,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //Heading
                      MyText(
                        'HELP & SUPPORT',
                        size: 20 * sp,
                        weight: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      //Categories
                      ...List.generate(
                        helpAndSupport.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
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
                  margin: const EdgeInsets.only(
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
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            height: 55,
                            width: w * 0.4,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
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
                      const SizedBox(height: 10),
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
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                '${svgsAssets[index]}',
                                height: 25,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
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
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  '${imagesEleven[index]}',
                                  height: 50,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          MyText('100% SECURE PAYMENTS'),
                          ...List.generate(
                            imagesTwelves.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      ExpandablePanel(
                        header: MyText(
                          expandHeader[0],
                          weight: FontWeight.w500,
                        ),
                        collapsed: const Text(''),
                        expanded: Text(
                          expandData[0],
                          softWrap: true,
                        ),
                      ),
                      const Divider(),
                      ExpandablePanel(
                        header: MyText(
                          expandHeader[1],
                          weight: FontWeight.w500,
                        ),
                        collapsed: const Text(''),
                        expanded: Text(
                          expandData[1],
                          softWrap: true,
                        ),
                      ),
                      const Divider(),
                      ExpandablePanel(
                        header: MyText(
                          expandHeader[2],
                          weight: FontWeight.w500,
                        ),
                        collapsed: const Text(''),
                        expanded: Text(
                          expandData[2],
                          softWrap: true,
                        ),
                      ),
                      const Divider(),
                      MyText(
                        '©2022 All Rights Reserved',
                        weight: FontWeight.w500,
                      ),
                      const SizedBox(height: 100),
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

LoginAlertBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 50,
        ),
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close),
                      ),
                    ]),
                const SizedBox(height: 10),
                MyText(
                  'WELCOME, BE A PART OF US',
                  size: 16,
                  weight: FontWeight.bold,
                  color: Colors.grey,
                ),
                const SizedBox(height: 50),
                MyText(
                  'Continue with Mobile Number or Email',
                  size: 16,
                  weight: FontWeight.w400,
                  color: Colors.grey,
                ),
                const SizedBox(height: 15),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Mobile Number or Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.orange,
                  child: Center(
                    child: MyText('Continue', color: Colors.white),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: MyText('OR'),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                MyText(
                  'Continue with',
                  size: 16,
                  weight: FontWeight.w400,
                  color: Colors.grey,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child: Image.asset(
                        'assets/images/google.png',
                        height: 40,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child: Image.asset(
                        'assets/images/fblogoo.png',
                        height: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'By continuing, you are agree to our ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      TextSpan(
                        text: 'terms and conditions ',
                        style: TextStyle(
                          color: Color(0xff0000FF),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      TextSpan(
                        text: 'See our',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      TextSpan(
                        text: ' privacy notice',
                        style: TextStyle(
                          color: Color(0xff0000FF),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// ignore: non_constant_identifier_names
SignUpAlertBox(
  BuildContext context,
) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    'Sign Up',
                    weight: FontWeight.w400,
                    size: 14,
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
              MyText(
                'Hi new user buddy, let\'s you started with us',
                weight: FontWeight.bold,
                size: 14,
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'India(+91)',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.orange,
                child: Center(
                  child: MyText(
                    'Continue',
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: MyText(
                      'OR',
                      size: 14,
                      weight: FontWeight.w400,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              MyText(
                'Continue with',
                size: 16,
                weight: FontWeight.w400,
                color: Colors.grey,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: Image.asset(
                      'assets/images/google.png',
                      height: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: Image.asset(
                      'assets/images/fblogoo.png',
                      height: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'By continuing, you are agree to our ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextSpan(
                      text: 'terms and conditions ',
                      style: TextStyle(
                        color: Color(0xff0000FF),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextSpan(
                      text: 'See our',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextSpan(
                      text: ' privacy notice',
                      style: TextStyle(
                        color: Color(0xff0000FF),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<bool> onBackButtonPressed(BuildContext context) async {
  bool exit = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Really?"),
        content: Text('Do you wnat to close app'),
        actions: [
          TextButton(
            onPressed: () {
              (Navigator.of(context).pop(false));
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text('yes'),
          ),
        ],
      );
    },
  );
  return exit ?? false;
}
