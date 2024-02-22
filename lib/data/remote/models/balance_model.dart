import 'dart:convert';

class BalanceModel {
  final String status;
  final Data data;
  final Error error;

  BalanceModel({
    required this.status,
    required this.data,
    required this.error,
  });

  factory BalanceModel.fromJson(String str) =>
      BalanceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BalanceModel.fromMap(Map<String, dynamic> json) => BalanceModel(
        status: json["status"],
        data: Data.fromMap(json["data"]),
        error: Error.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
        "error": error.toMap(),
      };
}

class Data {
  final List<Crypto> data;
  final List<DataCurrencyList> dataCurrencyList;

  Data({
    required this.data,
    required this.dataCurrencyList,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        data: List<Crypto>.from(json["data"].map((x) => Crypto.fromMap(x))),
        dataCurrencyList: List<DataCurrencyList>.from(
            json["dataCurrencyList"].map((x) => DataCurrencyList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "dataCurrencyList":
            List<dynamic>.from(dataCurrencyList.map((x) => x.toMap())),
      };
}

class Crypto {
  final String coin;
  final bool status;
  final num amount;
  final num amountCommission;
  final String network;
  final num minimumAmountReplenishment;
  final num minimumWithdrawalAmount;
  final String coinComission;
  final num priceToUsd;
  final Map priceBalanceInCurrency;
  final Map priceInCurrency;

  Crypto({
    required this.coin,
    required this.status,
    required this.amount,
    required this.amountCommission,
    required this.network,
    required this.minimumAmountReplenishment,
    required this.minimumWithdrawalAmount,
    required this.coinComission,
    required this.priceToUsd,
    required this.priceBalanceInCurrency,
    required this.priceInCurrency,
  });

  factory Crypto.fromJson(String str) => Crypto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Crypto.fromMap(Map<String, dynamic> json) => Crypto(
        coin: json["coin"],
        status: json["status"],
        amount: json["amount"],
        amountCommission: json["amountCommission"]?.toDouble(),
        network: json["network"],
        minimumAmountReplenishment:
            json["minimumAmountReplenishment"]?.toDouble(),
        minimumWithdrawalAmount: json["minimumWithdrawalAmount"]?.toDouble(),
        coinComission: json["coinComission"],
        priceToUsd: json["priceToUsd"]?.toDouble(),
        priceBalanceInCurrency: json["priceBalanceInCurrency"],
        priceInCurrency: json["priceInCurrency"],
      );

  Map<String, dynamic> toMap() => {
        "coin": coin,
        "status": status,
        "amount": amount,
        "amountCommission": amountCommission,
        "network": network,
        "minimumAmountReplenishment": minimumAmountReplenishment,
        "minimumWithdrawalAmount": minimumWithdrawalAmount,
        "coinComission": coinComission,
        "priceToUsd": priceToUsd,
        "priceBalanceInCurrency": priceBalanceInCurrency,
        "priceInCurrency": priceInCurrency,
      };
}

class PriceCeInCurrency {
  final num usd;
  final num rub;
  final num eur;

  PriceCeInCurrency({
    required this.usd,
    required this.rub,
    required this.eur,
  });

  factory PriceCeInCurrency.fromJson(String str) =>
      PriceCeInCurrency.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PriceCeInCurrency.fromMap(Map<String, dynamic> json) =>
      PriceCeInCurrency(
        usd: json["usd"]?.toDouble(),
        rub: json["rub"]?.toDouble(),
        eur: json["eur"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "usd": usd,
        "rub": rub,
        "eur": eur,
      };
}

class DataCurrencyList {
  final String name;
  final String symbol;

  DataCurrencyList({
    required this.name,
    required this.symbol,
  });

  factory DataCurrencyList.fromJson(String str) =>
      DataCurrencyList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataCurrencyList.fromMap(Map<String, dynamic> json) =>
      DataCurrencyList(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "symbol": symbol,
      };
}

class Error {
  Error();

  factory Error.fromJson(String str) => Error.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Error.fromMap(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toMap() => {};
}
