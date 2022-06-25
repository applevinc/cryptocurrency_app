import 'package:cryptocurrency_app/widgets/trade_percent_value_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TradePercentController sut;

  setUp(() {
    sut = TradePercentController();
  });

  group('TradePercentController.select', () {
    test('should select percent when tapped', () {
      // act
      sut.select(sut.percents.last);

      // assert
      expect(sut.percents.last.isSelected, true);
    });

    test('should unselect selected percent when tapped', () {
      // act
      sut.select(sut.percents.last);
      expect(sut.percents.last.isSelected, true);
      sut.select(sut.percents.last);

      // assert
      expect(sut.percents.last.isSelected, false);
    });
  });

  group('TradePercentController.unSelectOthersExcept', () {
    test('should unselect former selected percent when a new percent is tapped', () {
      // act
      sut.select(sut.percents.last);
      sut.unSelectOthersExcept(sut.percents.last);

      // assert
      expect(sut.percents.last.isSelected, true);
      expect(sut.percents.first.isSelected, false);
    });
  });
}
