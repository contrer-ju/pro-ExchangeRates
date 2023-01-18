import 'package:intl/intl.dart';
import 'package:the_exchange_app/constants/cripto_currencies.dart';

String numberFormat(double amount, String isoCode, bool isEnglish) {
  final fiatFormat =
      NumberFormat.currency(symbol: '', locale: isEnglish ? 'en_US' : 'es');
  final lowCryptoFormat = NumberFormat.currency(
      decimalDigits: 6, symbol: '', locale: isEnglish ? 'en_US' : 'es');
  final highCryptoFormat = NumberFormat.currency(
      decimalDigits: 4, symbol: '', locale: isEnglish ? 'en_US' : 'es');

  for (int i = 0; i < kCriptoCurrenciesList.length; i++) {
    if (isoCode == kCriptoCurrenciesList[i].currencyISOCode) {
      if (amount < 1) {
        return lowCryptoFormat.format(amount);
      } else {
        return highCryptoFormat.format(amount);
      }
    }
  }
  return fiatFormat.format(amount);
}

int numberOfDigits(String isoCode) {
  for (int i = 0; i < kCriptoCurrenciesList.length; i++) {
    if (isoCode == kCriptoCurrenciesList[i].currencyISOCode) {
      return 6;
    }
  }
  return 2;
}
