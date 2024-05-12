
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    final int value = int.parse(newValue.text.replaceAll(',', ''));
    final String newText = NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp').format(value);
    
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

String formatCurrency(String value) {
    // Konversi nilai string ke integer
    int intValue = int.tryParse(value.replaceAll(',', '')) ?? 0;

    // Format nilai menjadi mata uang IDR
    return NumberFormat.currency(locale: 'id_IDR', symbol: 'Rp', decimalDigits: 0).format(intValue);
  }

//format currency with K for thousand, M for million, B for billion
String formatCurrencyShort(String value) {
  // Konversi nilai string ke integer
  int intValue = int.tryParse(value.replaceAll(',', '')) ?? 0;

  // Format nilai menjadi mata uang IDR
  if (intValue >= 1000000) {
    return '${(intValue / 1000000).toStringAsFixed(1)}jt'; 
  } else if (intValue >= 1000) {
    return '${(intValue / 1000).toStringAsFixed(1)}K';
  } else {
    return NumberFormat.currency(locale: 'id_IDR', symbol: 'Rp', decimalDigits: 0).format(intValue);
  }
}