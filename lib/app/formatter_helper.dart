class FormatterHelper {
  static String formatDate(DateTime d) {
    two(int n) => n.toString().padLeft(2, '0');
    return '${two(d.day)}/${two(d.month)}/${d.year}';
  }
}
