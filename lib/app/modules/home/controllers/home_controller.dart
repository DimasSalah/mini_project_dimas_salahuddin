
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tatrupiah_si/app/data/services/transaction_service.dart';

import '../../../data/model/transaction_model.dart';
import '../../../data/services/total_balance_service.dart';

class HomeController extends GetxController {
  RxString name = ''.obs;
  RxInt totalIncome = 0.obs;
  RxInt totalExpense = 0.obs;
  Rx<DateTime> firstDayOfMonth = DateTime(DateTime.now().year, DateTime.now().month, 1).obs; // first day of the month
  Rx<DateTime> lastDayOfMonth = DateTime(DateTime.now().year, DateTime.now().month + 1, 0).obs; 
  Rx<DateTime> firstTimeDay = DateTime.now().obs;
  Rx<DateTime> lastTimeDay = DateTime.now().add(const Duration(days: 1)).obs;


  var transactions = <TransactionModel>[].obs;

  Future<void> getTransaction() async {
    final TransactionService transactionService = TransactionService();
    final response = await transactionService.getTransactions(
      dateFormat.format(firstTimeDay.value),
      dateFormat.format(lastTimeDay.value),
    );
      transactions.value = response;
  }
  
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  Future<void> getTotalBalance() async {
    final totalBalanceService = TotalBalanceService();
    await totalBalanceService.getTotalBalance(
      dateFormat.format(firstDayOfMonth.value),
      dateFormat.format(lastDayOfMonth.value),
    ).then((value) {
      totalIncome.value = value.data['total_income'];
      totalExpense.value = value.data['total_expense'];
    });
  }

  void updateTransaction() {
    getTransaction();
    getTotalBalance();
    update(['transaction']);
  }

  void selectedDate(DateTime date) {
    firstTimeDay.value = date;
    lastTimeDay.value = date.add(const Duration(days: 1));
    getTransaction();
    getTotalBalance();
    update(['transaction']);
  }


  


  @override
  void onInit() {
    getTransaction();
    getTotalBalance();
    super.onInit();
  }



}
