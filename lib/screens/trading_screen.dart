import 'package:cryptocurrency_app/core/assets/icons.dart';
import 'package:cryptocurrency_app/core/styles/colors.dart';
import 'package:cryptocurrency_app/widgets/circular_crypto_icon.dart';
import 'package:cryptocurrency_app/widgets/custom_appbar.dart';
import 'package:cryptocurrency_app/widgets/custom_arrow_tab.dart';
import 'package:cryptocurrency_app/widgets/custom_divider.dart';
import 'package:cryptocurrency_app/widgets/trade_percent_value_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TradingScreen extends StatelessWidget {
  const TradingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: CustomAppBar(title: 'Trading')),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),
              SliverToBoxAdapter(
                child: CustomTabBar(
                  isScrollable: true,
                  padding: EdgeInsets.only(left: 13.w),
                  labelFontSize: 12.sp,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: const [
                    CustomArrowTab(
                      prefix: 'BTC',
                      suffix: 'ETH',
                    ),
                    CustomArrowTab(
                      prefix: 'ETH',
                      suffix: 'EUR',
                    ),
                    CustomArrowTab(
                      prefix: 'ADA',
                      suffix: 'ETH',
                    ),
                    CustomArrowTab(
                      prefix: 'EOS',
                      suffix: 'ETH',
                    ),
                    CustomArrowTab(
                      prefix: 'EOS',
                      suffix: 'ETH',
                    ),
                  ],
                ),
              ),
              const _TabBarView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabBarView extends StatelessWidget {
  const _TabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: TabBarView(
        physics: BouncingScrollPhysics(),
        children: [
          BaseTabView(),
          BaseTabView(),
          BaseTabView(),
          BaseTabView(),
          BaseTabView(),
        ],
      ),
    );
  }
}

class BaseTabView extends StatelessWidget {
  const BaseTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CryptoIcon(
                      size: 10.sp,
                      icon: AppIcons.btc,
                      color: AppColors.red,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'BTC',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.dark,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Bitcoin',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.gray,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: '\$ 29 850.15 ',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.dark,
                          fontSize: 17.sp,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 34.h),
            const CustomTabBar(
              tabs: [
                Tab(text: 'Buy'),
                Tab(text: 'Sell'),
              ],
            ),
            const Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  _TradeInfoView(),
                  _TradeInfoView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TradeInfoView extends StatelessWidget {
  const _TradeInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final grayTextStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 13.sp,
          color: AppColors.gray,
        );

    final darkTextStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 16.sp,
          color: AppColors.dark,
        );

    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estimated purchase value',
            style: grayTextStyle,
          ),
          SizedBox(height: 5.h),
          Text(
            '0.000241',
            style: darkTextStyle,
          ),
          SizedBox(height: 8.h),
          const CustomDivider(),
          SizedBox(height: 17.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trade value',
                    style: grayTextStyle,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '0.000241',
                    style: darkTextStyle,
                  ),
                ],
              ),
              Consumer<TradePercentController>(
                builder: (BuildContext context, controller, Widget? child) {
                  final tradePercents = controller.percents;
                  return Wrap(
                    spacing: 5.w,
                    children: List.generate(
                      tradePercents.length,
                      (index) {
                        final tradePercent = tradePercents[index];
                        return TradePercentValueButton(tradePercent);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 8.h),
          const CustomDivider(),
          SizedBox(height: 17.h),
          Text(
            'Trade fee',
            style: grayTextStyle,
          ),
          SizedBox(height: 5.h),
          Text(
            '0.20% = 0.04 EUR',
            style: darkTextStyle.copyWith(
              color: AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}
