import 'package:cryptocurrency_app/core/assets/icons.dart';
import 'package:cryptocurrency_app/core/helpers/helper_functions.dart';
import 'package:cryptocurrency_app/models/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard(
    this.wallet, {
    Key? key,
  }) : super(key: key);

  final Wallet wallet;

  @override
  Widget build(BuildContext context) {
    final balance = HelperFunctions.currencyFormmatter(wallet.balance);
    final currency = wallet.currency;
    final color = wallet.shadowColor;

    return Container(
      width: 305.w,
      margin: EdgeInsets.only(left: 24.w, bottom: 28.h),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          colors: wallet.colors,
          begin: Alignment.bottomLeft,
          stops: const [0.06, 1.5],
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.15),
            offset: Offset(0, 13.h),
            blurRadius: 25,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$currency $balance',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 26.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SvgPicture.asset(
                    AppIcons.btcBorder,
                    height: 30.h,
                    width: 30.w,
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                'Your balance is equivalent',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 14.sp,
                      color: Colors.white.withOpacity(.7),
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              const ActionButton(label: 'Deposit'),
              SizedBox(width: 8.w),
              const ActionButton(label: 'Withdraw'),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.2),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.button!.copyWith(
              fontSize: 12.sp,
              color: Colors.white,
            ),
      ),
    );
  }
}
