import 'dart:ui';

const Color kdarkblue = Color(0xff181818);

List imagesOne = [
  'assets/images/buygetfree.png',
  'assets/images/free2.png',
  'assets/images/free3.png',
  'assets/images/free4.png',
  'assets/images/free5.png',
  'assets/images/free6.png',
  'assets/images/free7.png',
];

List imagesTwo = [
  'assets/images/flashSale1.jpg',
  'assets/images/flashSale2.jpg',
  'assets/images/flashSale3.jpg',
  'assets/images/flashSale4.jpg',
  'assets/images/flashSale5.jpg',
];

List imagesThree = [
  'assets/images/popular1.png',
  'assets/images/popular2.png',
  'assets/images/popular3.png',
  'assets/images/popular4.png',
  'assets/images/popular5.png',
  'assets/images/popular6.png',
  'assets/images/popular7.png',
  'assets/images/popular8.png',
  'assets/images/popular9.png',
  'assets/images/popular10.png',
];

List imagesFour = [
  'assets/images/offer1.png',
  'assets/images/offer2.png',
];

List imagesFive = [
  'assets/images/sale1.png',
  'assets/images/sale2.png',
  'assets/images/sale3.png',
  'assets/images/sale1.png',
  'assets/images/sale2.png',
  'assets/images/sale3.png',
  'assets/images/sale1.png',
  'assets/images/sale2.png',
  'assets/images/sale3.png',
  'assets/images/sale1.png',
  'assets/images/sale2.png',
  'assets/images/sale3.png',
];

List imagesSix = [
  'assets/images/fashion1.png',
  'assets/images/fashion2.png',
];
List imagesSeven = [
  'assets/images/bestseller1.png',
  'assets/images/bestseller2.png',
  'assets/images/bestseller3.png',
  'assets/images/bestseller5.png',
];

List imagesEight = [
  'assets/images/benchali.png',
  'assets/images/benchali1.png',
  'assets/images/benchali2.png',
  'assets/images/benchali.png',
  'assets/images/benchali1.png',
  'assets/images/benchali2.png',
  'assets/images/benchali.png',
  'assets/images/benchali1.png',
  'assets/images/benchali2.png',
];

List imagesNine = [
  'assets/images/dailyDrop1.png',
  'assets/images/dailyDrop2.png',
];

List imagesTen = [
  'assets/images/easy_return.png',
  'assets/images/free-delivery.png',
  'assets/images/cod.png',
];

List imagesTenNames = [
  'EASY RETURN',
  'FREE DELIVERY',
  'COD AVAILABLE',
];

List imagesTenDetails = [
  '30 Day\Return\nPolicy',
  'Payment\nOnline',
  '@ Rs. 49 Per\nOrder',
];

List imagesEleven = [
  'assets/images/gplay.png',
  'assets/images/appStore.png',
];

List imagesTwelves = [
  'assets/images/visa.png',
  'assets/images/master.png',
  'assets/images/discover.png',
  'assets/images/clearpay.png',
  'assets/images/paypal.png',
];

List imagesThirteen = [
  'assets/images/2 (1).jpg',
  'assets/images/2.jpg',
  'assets/images/3.jpg',
  'assets/images/4.jpg',
  'assets/images/5.jpg',
  'assets/images/6.jpg',
  'assets/images/7.jpg',
  'assets/images/8.jpg',
  'assets/images/9.jpg',
];

List customerService = [
  'Track My Order',
  'Help',
  'Returns',
  'Delivery Info',
  'Return Order',
  'Payment Method',
];
List companyInfo = [
  'About',
  'Size Guide',
  'App',
  'Gift Cards',
  'Become An Affiliate',
  'Become A Partner',
  'Discount & Promo Codes',
  'Blog',
];
List helpAndSupport = [
  'Contact Us',
  'Refund Policy',
  'Privacy Policy',
  'Terms & Conditions',
  'Faq\'s',
  'Sitemap',
];

List svgsAssets = [
  'assets/images/fb.svg',
  'assets/images/insta.svg',
  'assets/images/twittr.svg',
  'assets/images/youtube.svg',
  'assets/images/pinterest.svg',
];
List expandHeader = [
  'WHO WE ARE',
  'WHY CHOOSE US',
  'NAVIGATION LINK',
];
List expandData = [
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
];
List<Color> conColor = [
  Color(0xff6C757D),
  Color(0xffFFFFFF),
  Color(0xff000000),
  Color(0xff0DCAF0),
  Color(0xffF8F9FA),
  Color(0xffFFC107),
  Color(0xffDC3545),
];
List letters = [
  'S',
  'M',
  'L',
  'XL',
  '2XL',
  '3XL',
];
List faqs = [
  'SAVE EXTRA 1 OFFER',
  'PRODUCT DESCRIPTION',
  '15 DAYS RETURN AND EXCHANGE',
  'GET THIS BY 21ST STEPS'
];

class RatingModel {
  final lead;
  final trail;
  double percent;

  RatingModel({required this.lead, required this.trail, this.percent = 0.2});
}

List<RatingModel> ratingList = [
  RatingModel(lead: '5', trail: '726', percent: 0.7),
  RatingModel(lead: '4', trail: '172', percent: 0.6),
  RatingModel(lead: '3', trail: '62', percent: 0.2),
  RatingModel(lead: '2', trail: '34', percent: 0.5),
  RatingModel(lead: '1', trail: '77', percent: 0.8),
];
