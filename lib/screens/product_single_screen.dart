import 'package:badges/badges.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:web_app/lists/list_holders.dart';

import '../reusable_widgets/text_widget.dart';

class ProductSingleScreen extends StatefulWidget {
  const ProductSingleScreen({Key? key}) : super(key: key);

  @override
  State<ProductSingleScreen> createState() => _ProductSingleScreenState();
}

class _ProductSingleScreenState extends State<ProductSingleScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var sp = MediaQuery.textScaleFactorOf(context);

    return SafeArea(
      child: Scaffold(
        // key: _key,

        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Container(
            width: w - 10,
            padding: EdgeInsets.only(top: 10, right: w * 0.055),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        print('object');
                      },
                      icon: Icon(
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
                SizedBox(width: w * 0.05),
                Expanded(
                  child: Row(
                    children: [
                      MyText(
                        'Login',
                        color: Colors.black,
                        size: 16 * sp,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(width: 10),
                      MyText(
                        'Signup',
                        color: Colors.black,
                        size: 16 * sp,
                        weight: FontWeight.bold,
                      ),
                      Flexible(
                        child: Icon(
                          Icons.search_sharp,
                          color: Colors.black,
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
            _SingleProductView(),
            Text('Content for tab 2'),
            Text('Content for tab 2'),
            Text('Content for tab 2'),
          ],
        ),
      ),
    );
  }
}

class _SingleProductView extends StatelessWidget {
  const _SingleProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );
    var size = MediaQuery.of(context).size;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var sp = MediaQuery.textScaleFactorOf(context);
    final double itemHeight = (size.height - kToolbarHeight) / 2;
    final double itemWidth = size.width / 2;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50),
            height: h * 0.6,
            decoration: BoxDecoration(
              color: kdarkblue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/singleProduct.jpeg'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  'Garfield: Lasagna',
                  size: 20 * sp,
                  weight: FontWeight.bold,
                ),
                MyText(
                  'Women\'s Blue Boyfriend T-shirt',
                  size: 18 * sp,
                  weight: FontWeight.w400,
                ),
                SizedBox(height: 20),
                MyText(
                  'By Garfield',
                  size: 18 * sp,
                  weight: FontWeight.w400,
                ),
                Row(
                  children: [
                    MyText(
                      '₹349',
                      size: 18 * sp,
                      color: Color(0xffFA693C),
                      weight: FontWeight.w400,
                    ),
                    SizedBox(width: 10),
                    MyText(
                      '₹999',
                      size: 18 * sp,
                      weight: FontWeight.w400,
                      textDeco: TextDecoration.lineThrough,
                    ),
                    SizedBox(width: 10),
                    MyText(
                      '65% OFF',
                      size: 18 * sp,
                      color: Colors.green,
                      weight: FontWeight.w400,
                      textDeco: TextDecoration.lineThrough,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                MyText(
                  'inclusive of all taxes',
                  size: 12 * sp,
                  color: Colors.grey,
                  weight: FontWeight.w400,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(5),
                  color: Color(0xff33C675),
                  child: MyText(
                    'BUY 2 FOR 599',
                    size: 18 * sp,
                    color: Colors.white,
                    weight: FontWeight.w400,
                  ),
                ),
                Divider(),
                RichText(
                  text: TextSpan(
                    style: textStyle,
                    children: [
                      TextSpan(
                        text: 'TriBe members get an extra discount of',
                      ),
                      TextSpan(
                        text: ' ₹20',
                      ),
                      TextSpan(
                        text: ' and FREE shipping.',
                      ),
                      TextSpan(
                        style: TextStyle(
                          color: Color(0xff85A3B1),
                        ),
                        text: ' Learn more',
                      ),
                    ],
                  ),
                ),
                Divider(),
                MyText(
                  'COLOR OPTION',
                  size: 20 * sp,
                  weight: FontWeight.bold,
                ),
                Row(
                  children: [
                    ...List.generate(
                        conColor.length,
                        (index) => Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: 10, top: 10, bottom: 10),
                                height: 45,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                  color: conColor[index],
                                ),
                              ),
                            )),
                  ],
                ),
                Divider(thickness: 2),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      'SELECT SIZE',
                      size: 20 * sp,
                      weight: FontWeight.bold,
                    ),
                    MyText(
                      'Size Guide',
                      size: 16 * sp,
                      weight: FontWeight.w400,
                      color: Colors.teal,
                      textDeco: TextDecoration.underline,
                    ),
                  ],
                ),
                Row(
                  children: [
                    ...List.generate(
                        letters.length,
                        (index) => Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: 10,
                                  top: 10,
                                  bottom: 10,
                                ),
                                height: 45,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: MyText(letters[index],
                                      color: Colors.grey),
                                ),
                              ),
                            )),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    MyText(
                      'Qty',
                      size: 16 * sp,
                      weight: FontWeight.w400,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              color: kdarkblue,
                            ),
                          ),
                          MyText(
                            '1',
                            size: 16 * sp,
                            weight: FontWeight.w400,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: kdarkblue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                          color: Color(0xff2B2C4A),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            ),
                            MyText(
                              'ADD TO CART',
                              size: 16 * sp,
                              weight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kdarkblue),
                  ),
                  child: Center(
                    child: MyText(
                      'BUY IT NOW',
                      size: 16 * sp,
                      weight: FontWeight.bold,
                      color: kdarkblue,
                    ),
                  ),
                ),
                Divider(color: kdarkblue),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      ExpandablePanel(
                        header: MyText(
                          faqs[0],
                          weight: FontWeight.w500,
                        ),
                        collapsed: Text(''),
                        expanded: Text(
                          'Placeholder content for this accordion, which is intended to demonstrate the .accordion-flush class. This is the third item\'s accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.',
                          softWrap: true,
                        ),
                      ),
                      Divider(),
                      ExpandablePanel(
                        header: MyText(
                          faqs[1],
                          weight: FontWeight.w500,
                        ),
                        collapsed: Text(''),
                        expanded: Text(
                          'Placeholder content for this accordion, which is intended to demonstrate the .accordion-flush class. This is the third item\'s accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.',
                          softWrap: true,
                        ),
                      ),
                      Divider(),
                      ExpandablePanel(
                        header: MyText(
                          faqs[2],
                          weight: FontWeight.w500,
                        ),
                        collapsed: Text(''),
                        expanded: Text(
                          'Placeholder content for this accordion, which is intended to demonstrate the .accordion-flush class. This is the third item\'s accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.',
                          softWrap: true,
                        ),
                      ),
                      Divider(),
                      ExpandablePanel(
                        header: MyText(
                          faqs[3],
                          weight: FontWeight.w500,
                        ),
                        collapsed: Text(''),
                        expanded: Text(
                          'Placeholder content for this accordion, which is intended to demonstrate the .accordion-flush class. This is the third item\'s accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.',
                          softWrap: true,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            'Rating and reviews',
                            size: 20 * sp,
                            weight: FontWeight.bold,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: kdarkblue,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: MyText(
                                'Rating and reviews',
                                size: 20 * sp,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyText(
                            '4.3',
                            size: 35 * sp,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                'Base on',
                                size: 18 * sp,
                                weight: FontWeight.w400,
                              ),
                              MyText(
                                '1k rating and 300 review',
                                size: 18 * sp,
                                weight: FontWeight.w400,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.thumb_up),
                          SizedBox(width: 10),
                          MyText(
                            '84% customer liked this product',
                            size: 16 * sp,
                            weight: FontWeight.w400,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        ratingList.length,
                        (index) => Row(
                          children: [
                            MyText('${ratingList[index].lead}'),
                            SizedBox(width: 10),
                            Icon(Icons.star),
                            SizedBox(width: 10),
                            Expanded(
                              child: LinearPercentIndicator(
                                padding: EdgeInsets.zero,
                                barRadius: Radius.circular(10),
                                lineHeight: 14.0,
                                percent: index == 0
                                    ? 0.7
                                    : index == 1
                                        ? 0.6
                                        : index == 2
                                            ? 0.4
                                            : index == 3
                                                ? 0.2
                                                : index == 4
                                                    ? 0.3
                                                    : 0.1,
                                backgroundColor: Colors.grey.withOpacity(0.5),
                                progressColor: kdarkblue,
                              ),
                            ),
                            SizedBox(width: 10),
                            MyText('${ratingList[index].trail}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      MyText(
                        'SIMILAR PRODUCT',
                        color: kdarkblue,
                        size: 16 * sp,
                        weight: FontWeight.bold,
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
                                  4,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductSingleScreen(),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                              '${ImagesThirteen[index]}'),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              MyText(
                                                '₹499',
                                                size: 16 * sp,
                                                color:
                                                    kdarkblue.withOpacity(0.7),
                                                weight: FontWeight.bold,
                                              ),
                                              MyText(
                                                ' ₹830',
                                                textDeco:
                                                    TextDecoration.lineThrough,
                                                size: 12 * sp,
                                                color: Colors.black,
                                                weight: FontWeight.w400,
                                              ),
                                            ],
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
                    ],
                  ),
                ),
                Container(
                  color: Color(0xffF3F3F3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                    SizedBox(height: 10),
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
          )
        ],
      ),
    );
  }
}
