import 'dart:math';

class ThankYouNotes {
  static List<String> _thankYouNotes = [
    "Thank you for shopping with us! We hope to see you again soon.",
    "Your purchase is greatly appreciated. Thank you for your support!",
    "We are grateful for your business. Thank you for choosing us!",
    "Thank you for being a valued customer. We appreciate your loyalty.",
    "Your order is confirmed. Thank you for shopping at our store!"
  ];

  static String getRandomThankYouNote() {
    final random = Random();
    final index = random.nextInt(_thankYouNotes.length);
    return _thankYouNotes[index];
  }
}