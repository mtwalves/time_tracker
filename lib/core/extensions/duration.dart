extension Formatter on Duration {
  String inHHmm() {
    String twoDigits(int n) => n.abs().toString().padLeft(2, '0');

    String twoDigitMinutes = twoDigits(this.inMinutes.remainder(60));
    String twoDigitHours = twoDigits(this.inHours);
    String sign = this.isNegative ? '-' : '';

    return "$sign$twoDigitHours:$twoDigitMinutes";
  }
}
