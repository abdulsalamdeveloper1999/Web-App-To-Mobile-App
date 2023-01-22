import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:web_app/lists/list_holders.dart';
import 'package:web_app/reusable_widgets/text_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

final List<String> sizeItems = ['S', 'M', 'L', 'XL', '2XL', '3XL'];
final List<String> qtyItems = ['0', '1', '2', '3', '4', '5', '6', '7', '8'];

String? selectedValue;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var sp = MediaQuery.textScaleFactorOf(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.02),
                  child: MyText(
                    'MY BAG 0 items(s)',
                    weight: FontWeight.bold,
                    size: 16,
                  ),
                ),
                ...List.generate(
                  2,
                  (index) => Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(
                        horizontal: w * 0.03, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    'Ice Water Blue Half Sleeve T-Shirt',
                                    weight: FontWeight.w400,
                                    size: 16 * sp,
                                  ),
                                  SizedBox(height: 8),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "₹349 ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16 * sp,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        TextSpan(
                                          text: " ₹799",
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16 * sp,
                                            fontFamily: 'Poppins',
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  MyText(
                                    'You saved ₹450!',
                                    weight: FontWeight.w400,
                                    size: 16 * sp,
                                    color: Colors.green,
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 50,
                                          width: w * 0.22,
                                          child: DropdownButtonFormField2(
                                            decoration: InputDecoration(
                                              //Add isDense true and zero Padding.
                                              //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                              isDense: true,
                                              contentPadding: EdgeInsets.zero,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              //Add more decoration as you want here
                                              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                            ),
                                            isExpanded: true,
                                            hint: Text(
                                              'Size',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black45,
                                            ),
                                            iconSize: 30,
                                            buttonHeight: 60,
                                            dropdownDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            items: sizeItems
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Please select gender.';
                                              }
                                            },
                                            onChanged: (value) {
                                              //Do something when changing the item if you want.
                                            },
                                            onSaved: (value) {
                                              selectedValue = value.toString();
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Expanded(
                                        child: SizedBox(
                                          height: 50,
                                          width: w * 0.22,
                                          child: DropdownButtonFormField2(
                                            decoration: InputDecoration(
                                              //Add isDense true and zero Padding.
                                              //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                              isDense: true,
                                              contentPadding: EdgeInsets.zero,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              //Add more decoration as you want here
                                              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                            ),
                                            isExpanded: true,
                                            hint: Text(
                                              'Qty',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black45,
                                            ),
                                            iconSize: 30,
                                            buttonHeight: 60,
                                            dropdownDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            items: qtyItems
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(
                                                        item,
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Please select gender.';
                                              }
                                            },
                                            onChanged: (value) {
                                              //Do something when changing the item if you want.
                                            },
                                            onSaved: (value) {
                                              selectedValue = value.toString();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: h * 0.3,
                                width: w * 0.35,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/images/ts.jpeg'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.grey),
                        SizedBox(
                          height: h * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyText(
                                'Remove',
                                size: 16 * sp,
                              ),
                              VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              MyText(
                                'Move to Wishlist',
                                size: 16 * sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: w * 0.035, vertical: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.badge),
                          SizedBox(width: 10),
                          Expanded(
                              child: MyText('Have a coupon/referral code ?')),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hintText: 'Enter code',
                                fillColor: Colors.grey.withOpacity(0.1),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              height: h * 0.085,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xff4FC8C9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: MyText(
                                  'APPLY',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: w * 0.035, vertical: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        'PRICE DETAILS',
                        color: Colors.black,
                        size: 16 * sp,
                        weight: FontWeight.bold,
                      ),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10),
                      ...List.generate(
                          productList.length,
                          (index) => Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText(
                                      '${productList[index].leftText}',
                                      color: Colors.grey,
                                    ),
                                    MyText(
                                      '${productList[index].rightText}',
                                      color: index == 2
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                  ],
                                ),
                              )),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            'Total amount',
                            color: Colors.black,
                            weight: FontWeight.bold,
                          ),
                          MyText(
                            '₹ 397',
                            color: Colors.black,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(5),
                        color: Colors.green,
                        child: Center(
                          child: MyText(
                            'You saved ₹ 190 on this order',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(15),
                        color: Color(0xff293148),
                        child: Center(
                          child: MyText(
                            'PLACE ORDER',
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: w * 0.045, vertical: 20),
                  child: Wrap(
                    children: [
                      ...List.generate(
                        imagesTwelves.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Image.asset(
                            '${imagesTwelves[index]}',
                            height: 35,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/gpay.png',
                        height: 35,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class productDetail {
  final leftText;
  final rightText;

  productDetail({required this.leftText, required this.rightText});
}

List<productDetail> productList = [
  productDetail(leftText: 'Total MRP (Incl. of taxes)', rightText: '₹ 549'),
  productDetail(leftText: 'Beyoung Discount', rightText: '- ₹ 190'),
  productDetail(leftText: 'Shipping', rightText: 'FREE'),
  productDetail(leftText: 'Cart Total', rightText: '₹ 359'),
];
