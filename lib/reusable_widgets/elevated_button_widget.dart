import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/reusable_widgets/text_widget.dart';

class MyButton extends StatelessWidget {
  var bgcolor;
  final text;
  var textColor;
  var bdcolor;
  VoidCallback? onPress;
  bool loading;

  MyButton({
    Key? key,
    required this.text,
    this.loading = false,
    this.bdcolor = Colors.black,
    this.bgcolor = Colors.black,
    this.textColor = Colors.black,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SizedBox(
      width: w,
      height: h * 0.082,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            width: 1.0,
            color: bdcolor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: bgcolor ?? Colors.white,
        ),
        onPressed: onPress,
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : MyText(
                  '$text',
                  size: 14,
                  color: textColor,
                ),
        ),
      ),
    );
  }
}
