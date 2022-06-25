import 'package:intl/intl.dart';

class HelperFunctions {
  HelperFunctions._();

  static String currencyFormmatter(num amount) {
    final formatCurrency = NumberFormat("#,##0.00", "en_US");
    return formatCurrency.format(amount).replaceAll(',', ' ');
  }
}
