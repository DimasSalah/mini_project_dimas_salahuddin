import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  RxBool changeTab = false.obs;
  RxString categoryValue = ''.obs;
  RxString categoryKey = ''.obs;
  RxString enteredValue = '0'.obs;
  Rx<DateTime> transactionDate = DateTime.now().obs;
  RxBool numberPad = false.obs;

  TextEditingController note = TextEditingController();
  
  Map<String, String> categoryExpanse = {
    'Makanan': 'assets/icons/fooddrink.svg',
    'Belanja': 'assets/icons/shopping.svg',
    'Hiburan': 'assets/icons/entertainment.svg',
    'Transportasi': 'assets/icons/transport.svg',
    'Pendidikan': 'assets/icons/education.svg',
    'Kesehatan': 'assets/icons/health.svg',
    'Lainnya': 'assets/icons/other.svg',
  };

  Map<String, String> categoryIncome = {
    'Gaji': 'assets/icons/salary.svg',
    'Investasi': 'assets/icons/investment.svg',
    'Pekerjaan Sampingan': 'assets/icons/sidejob.svg',
    'Hadiah': 'assets/icons/gift.svg',
    'Lainnya': 'assets/icons/other.svg',
  };

  void onChangeTabValue(bool value) {
    changeTab.value = value;
    enteredValue.value = '';
    categoryValue.value = '';
    categoryKey.value = '';
    note.clear();
  }

  void onEnterDate(DateTime date) {
    transactionDate.value = date;
  }

  void onEnterValue(String value) {
    enteredValue.value = value;
  }

  void onChangeCategoryValue(String value) {
    categoryValue.value = value;
  }

  void onChangeCategoryKey(String value) {
    categoryKey.value = value;
  }

  void visibleNumberPad(bool value) { //use for show or hide number pad
    numberPad.value = value;
  }

  void submitIncome() {
    //ptrint change tab value
    print(changeTab.value == true ? 'Pengeluaran' : 'Pendapatan');
    print('date ${transactionDate.value}');
    print('uang ${enteredValue.value}');
    print('key ${categoryValue.value == '' ? categoryIncome.keys.elementAt(0) : categoryValue.value}');
    print(note.text);

  }

}
