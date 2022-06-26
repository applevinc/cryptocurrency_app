import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoIcon extends StatelessWidget {
  const CryptoIcon({
    Key? key,
    this.size,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String icon;
  final double? size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size ?? 15.sp),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        height: 20.w,
        width: 20.w,
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
