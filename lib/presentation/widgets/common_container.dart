import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key, required this.child, required this.color});
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
