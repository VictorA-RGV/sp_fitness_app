import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


final isTappedProvider = StateProvider<String>((ref) {
  return "";
});
final isTappedProvider1 = StateProvider<String>((ref) {
  return "";
});

class AppTextButton1 extends StatelessWidget {
  const AppTextButton1({
    Key? key,
    this.width = double.infinity,
    this.height,
    this.buttonColor = Colors.black,
    required this.title,
    this.onTap,
    this.titleColor = Colors.white,
    this.isTapped = true,
    this.borderRadius,
    this.icondata,
  }) : super(key: key);
  final double? width;
  final double? height;
  final Color buttonColor;
  final String title;
  final Color titleColor;
  final Function()? onTap;
  final bool isTapped;
  final double? borderRadius;
  final IconData? icondata;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 58,
        width: width,
        decoration: BoxDecoration(
          gradient: isTapped
              ? const LinearGradient(
                  colors: [Colors.deepPurple, Colors.blue])
              : const LinearGradient(
                  colors: [Colors.white, Colors.white]),
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          color: isTapped ? Colors.blue : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icondata != null)
              Icon(
                icondata,
                color: Colors.white,
              ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                    color: isTapped ? Colors.white : Colors.black,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
