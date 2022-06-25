import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomArrowTab extends StatelessWidget {
  const CustomArrowTab({Key? key, required this.prefix, required this.suffix})
      : super(key: key);

  final String prefix;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(prefix.toUpperCase()),
        Icon(
          Icons.arrow_forward,
          size: 10.sp,
        ),
        Text(suffix.toUpperCase()),
      ],
    );
  }
}