import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/services/transaction_service.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';

class TransactionController extends GetxController {
  RxBool changeTab = false.obs;
  RxString categoryValue = ''.obs;
  RxString categoryKey = ''.obs;
  RxString enteredValue = '0'.obs;
  Rx<DateTime> transactionDate = DateTime.now().obs;
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
    'Sampingan': 'assets/icons/sidejob.svg',
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

  //if user not choose category, it will return the first category
  String getIconPath() {
    if (changeTab.value == true && categoryValue.value == '') {
      return categoryExpanse.values.elementAt(0);
    } else if (changeTab.value == false && categoryValue.value == '') {
      return categoryIncome.values.elementAt(0);
    } else {
      return categoryValue.value;
    }
  }

  String getCategory() {
    if (changeTab.value == true && categoryValue.value == '') {
      return categoryExpanse.keys.elementAt(0);
    } else if (changeTab.value == false && categoryValue.value == '') {
      return categoryIncome.keys.elementAt(0);
    } else {
      return categoryKey.value;
    }
  }

  Future<void> submit()  async {
    final transactionService = TransactionService();
    await transactionService.postTransaction(
      changeTab.value == true ? 'Pengeluaran' : 'Pendapatan',
      changeTab.value == true ? 0 : int.parse(enteredValue.value),
      changeTab.value == true ? int.parse(enteredValue.value) : 0,
      getIconPath(),
      getCategory(),
      note.text,
      transactionDate.value.toString(),
    );
    Get.put(HomeController()).updateTransaction();
    Get.offNamed(Routes.MAIN);
  }
}
