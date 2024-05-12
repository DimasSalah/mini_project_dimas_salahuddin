
class TransactionModel {
    int id;
    String userId;
    String type;
    int income;
    int expanse;
    String iconPath;
    String category;
    String note;
    String createdAt;

    TransactionModel({
        required this.id,
        required this.userId,
        required this.type,
        required this.income,
        required this.expanse,
        required this.iconPath,
        required this.category,
        required this.note,
        required this.createdAt,
    });

    factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        income: json["income"],
        expanse: json["expanse"],
        iconPath: json["icon_path"],
        category: json["category"],
        note: json["note"],
        createdAt: json["created_at"],
    );

}
                                                     