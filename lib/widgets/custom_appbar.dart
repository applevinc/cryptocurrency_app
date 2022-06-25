import 'package:cryptocurrency_app/core/assets/icons.dart';
import 'package:cryptocurrency_app/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 42.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.dark,
                  fontWeight: FontWeight.w600,
                  fontSize: 26.sp,
                ),
          ),
          SvgPicture.asset(
            AppIcons.settings,
            height: 30.h,
            width: 30.w,
          ),
        ],
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    Key? key,
    required this.tabs,
    this.isScrollable = false,
    this.padding,
    this.labelFontSize,
    this.height,
    this.indicatorSize,
  }) : super(key: key);

  final List<Widget> tabs;
  final bool isScrollable;
  final EdgeInsetsGeometry? padding;
  final double? labelFontSize;
  final double? height;
  final TabBarIndicatorSize? indicatorSize;

  @override
  Size get preferredSize => Size.fromHeight(height ?? 20.h);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: isScrollable,
      physics: const BouncingScrollPhysics(),
      padding: padding,
      labelColor: AppColors.dark,
      unselectedLabelColor: AppColors.gray,
      labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: labelFontSize,
          ),
      indicatorWeight: 1,
      indicatorSize: indicatorSize,
      tabs: tabs,
    );
  }
}
