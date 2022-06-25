import 'package:cryptocurrency_app/core/styles/colors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TradePercent extends Equatable {
  final int value;
  bool isSelected;

  TradePercent({
    required this.value,
    this.isSelected = false,
  });

  @override
  List<Object?> get props => [value, isSelected];
}

class TradePercentController extends ChangeNotifier {
  final List<TradePercent> _percents = [
    TradePercent(value: 25, isSelected: true),
    TradePercent(value: 50, isSelected: false),
    TradePercent(value: 100, isSelected: false),
  ];
  List<TradePercent> get percents => _percents;

  void select(TradePercent tradePercent) {
    if (tradePercent.isSelected) {
      _percents.firstWhere((element) => element == tradePercent).isSelected = false;
      _percents.first.isSelected = true;
      notifyListeners();
    } else {
      _percents.firstWhere((element) => element == tradePercent).isSelected = true;
      unSelectOthersExcept(tradePercent);
      notifyListeners();
    }
  }

  void unSelectOthersExcept(TradePercent newSelectedPercent) {
    for (var tradePercent in percents) {
      if (tradePercent != newSelectedPercent) {
        tradePercent.isSelected = false;
      }
    }
  }
}

class TradePercentValueButton extends StatelessWidget {
  const TradePercentValueButton(
    this.tradePercent, {
    Key? key,
  }) : super(key: key);

  final TradePercent tradePercent;

  @override
  Widget build(BuildContext context) {
    final value = tradePercent.value.toString();
    final isSelected = tradePercent.isSelected;

    return GestureDetector(
      onTap: () {
        final controller = context.read<TradePercentController>();
        controller.select(tradePercent);
      },
      child: Container(
        width: 43.w,
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: isSelected ? AppColors.blue : AppColors.gray),
        ),
        child: Text(
          '$value%',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.button!.copyWith(
                fontSize: 11.sp,
                color: isSelected ? AppColors.blue : AppColors.gray,
              ),
        ),
      ),
    );
  }
}
