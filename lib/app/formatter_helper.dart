import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';

class FormatterHelper {
  static String formatDate(DateTime d) {
    two(int n) => n.toString().padLeft(2, '0');
    return '${two(d.day)}/${two(d.month)}/${d.year}';
  }

  static String formatCurrency(int money) {
    var numFormatter = NumberFormat("#,##0", "fr_FR");
    return "${numFormatter.format(money)} VNĐ";
  }
}
