import 'package:cryptocurrency_app/core/helpers/helper_functions.dart';
import 'package:cryptocurrency_app/core/styles/colors.dart';
import 'package:cryptocurrency_app/models/crypto.dart';
import 'package:cryptocurrency_app/widgets/circular_crypto_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartTile extends StatelessWidget {
  const ChartTile(this.crypto, {Key? key}) : super(key: key);

  final Crypto crypto;

  @override
  Widget build(BuildContext context) {
    final name = crypto.name;
    final abreviation = crypto.abbreviation.toUpperCase();
    final percent = crypto.percent;
    final graph = crypto.graph;
    final amount = crypto.amount;
    final amountInUSD = HelperFunctions.currencyFormmatter(crypto.amountInUSD);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CryptoIcon(
                icon: crypto.icon,
                color: crypto.color,
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        crypto.abbreviation.toUpperCase(),
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.dark,
                            ),
                      ),
                      Positioned(
                        top: -3.h,
                        right: -40.w,
                        child: Text(
                          '$percent%',
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray,
                        ),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            graph,
            width: 95.w,
            height: 34.h,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  text: '\$ $amountInUSD',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.dark,
                        fontSize: 16.sp,
                      ),
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                '$amount $abreviation',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.gray,
                      fontSize: 12.sp,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
