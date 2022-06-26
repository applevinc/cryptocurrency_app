import 'package:cryptocurrency_app/core/assets/graphs.dart';
import 'package:cryptocurrency_app/core/assets/icons.dart';
import 'package:cryptocurrency_app/core/styles/colors.dart';
import 'package:cryptocurrency_app/models/crypto.dart';
import 'package:cryptocurrency_app/models/wallet.dart';
import 'package:cryptocurrency_app/widgets/balance_card.dart';
import 'package:cryptocurrency_app/widgets/chart_tile.dart';
import 'package:cryptocurrency_app/widgets/custom_appbar.dart';
import 'package:cryptocurrency_app/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBar(title: 'Portfolio'),
              SizedBox(height: 24.h),
              const _BalanceCardSection(),
              const _ChartsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BalanceCardSection extends StatefulWidget {
  const _BalanceCardSection({
    Key? key,
  }) : super(key: key);

  @override
  State<_BalanceCardSection> createState() => _BalanceCardSectionState();
}

class _BalanceCardSectionState extends State<_BalanceCardSection> {
  final wallets = [
    Wallet(
      balance: 42533,
      colors: [
        const Color(0xffB066FE),
        const Color(0xff63E2FF),
      ],
      shadowColor: const Color(0xff336AF2),
      currency: '€',
    ),
    Wallet(
      balance: 56533,
      colors: [
        const Color(0xffD74177),
        const Color(0xffFFE98A),
      ],
      shadowColor: const Color(0xffFF6551),
      currency: '\$',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return _tallerCard();
        } else {
          return _smallerCard();
        }
      },
    );
  }

  Widget _tallerCard() {
    return SizedBox(
      height: 330.h,
      child: _buildListView(),
    );
  }

  Widget _smallerCard() {
    return SizedBox(
      height: 250.h,
      child: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: wallets.length,
      padding: EdgeInsets.only(right: 24.w),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final wallet = wallets[index];
        return BalanceCard(wallet);
      },
    );
  }
}

class _ChartsSection extends StatefulWidget {
  const _ChartsSection({
    Key? key,
  }) : super(key: key);

  @override
  State<_ChartsSection> createState() => _ChartsSectionState();
}

class _ChartsSectionState extends State<_ChartsSection> {
  final charts = [
    Crypto(
      name: 'Bitcoin',
      abbreviation: 'BTC',
      icon: AppIcons.btc,
      graph: CryptoGraphs.btc,
      amount: 1.12412,
      amountInUSD: 29850.15,
      percent: 54.21,
      color: const Color(0xffEE6855),
    ),
    Crypto(
      name: 'Ethereum',
      abbreviation: 'ETH',
      icon: AppIcons.eth,
      graph: CryptoGraphs.eth,
      amount: 5.25827,
      amountInUSD: 10472.81,
      percent: 21.54,
      color: const Color(0xff35378D),
    ),
    Crypto(
      name: 'Litecoin',
      abbreviation: 'LTC',
      icon: AppIcons.ltc,
      graph: CryptoGraphs.ltc,
      amount: 5.72814,
      amountInUSD: 5241.20,
      percent: 11.25,
      color: const Color(0xff23B480),
    ),
    Crypto(
      name: 'Ripple',
      abbreviation: 'XRP',
      icon: AppIcons.xrp,
      graph: CryptoGraphs.xrp,
      amount: 3.94212,
      amountInUSD: 4250.97,
      percent: 7.46,
      color: const Color(0xff396BEF),
    ),
    Crypto(
      name: 'Zcash',
      abbreviation: 'ZEC',
      icon: AppIcons.zec,
      graph: CryptoGraphs.zec,
      amount: 3.94212,
      amountInUSD: 1462.45,
      percent: 2.17,
      color: Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Charts',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.gray,
                    ),
              ),
              Text(
                'See All',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.red,
                    ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            itemCount: charts.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final crypto = charts[index];
              return ChartTile(crypto);
            },
            separatorBuilder: (context, index) {
              return const CustomDivider();
            },
          ),
        ],
      ),
    );
  }
}
