// To parse this JSON data, do
//
//     final totalBalanceModel = totalBalanceModelFromJson(jsonString);

import 'dart:convert';

TotalBalanceModel totalBalanceModelFromJson(String str) => TotalBalanceModel.fromJson(json.decode(str));

String totalBalanceModelToJson(TotalBalanceModel data) => json.encode(data.toJson());

class TotalBalanceModel {
    String userId;
    int totalIncome;
    int totalExpense;

    TotalBalanceModel({
        required this.userId,
        required this.totalIncome,
        required this.totalExpense,
    });

    factory TotalBalanceModel.fromJson(Map<String, dynamic> json) => TotalBalanceModel(
        userId: json["user_id"],
        totalIncome: json["total_income"],
        totalExpense: json["total_expense"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "total_income": totalIncome,
        "total_expense": totalExpense,
    };
}
