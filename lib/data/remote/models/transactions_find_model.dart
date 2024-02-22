import 'dart:convert';

class TransactionsFindModel {
    final String status;
    final List<Transaction> data;
    final Error error;

    TransactionsFindModel({
        required this.status,
        required this.data,
        required this.error,
    });

    factory TransactionsFindModel.fromJson(String str) => TransactionsFindModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TransactionsFindModel.fromMap(Map<String, dynamic> json) => TransactionsFindModel(
        status: json["status"],
        data: List<Transaction>.from(json["data"].map((x) => Transaction.fromMap(x))),
        error: Error.fromMap(json["error"]),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "error": error.toMap(),
    };
}

class Transaction {
    final String hash;
    final String coin;
    final String explolerUrl;
    final num amount;
    final String date;
    final String type;

    Transaction({
        required this.hash,
        required this.coin,
        required this.explolerUrl,
        required this.amount,
        required this.date,
        required this.type,
    });

    factory Transaction.fromJson(String str) => Transaction.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        hash: json["hash"],
        coin: json["coin"],
        explolerUrl: json["explolerUrl"],
        amount: json["amount"]?.toDouble(),
        date: json["date"],
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "hash": hash,
        "coin": coin,
        "explolerUrl": explolerUrl,
        "amount": amount,
        "date": date,
        "type": type,
    };
}

class Error {
    Error();

    factory Error.fromJson(String str) => Error.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Error.fromMap(Map<String, dynamic> json) => Error(
    );

    Map<String, dynamic> toMap() => {
    };
}
