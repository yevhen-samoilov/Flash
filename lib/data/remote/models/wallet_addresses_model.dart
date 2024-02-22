import 'dart:convert';

class WalletAddressesModel {
  final String status;
  final Map<String, dynamic> data;
  final Error error;

  WalletAddressesModel({
    required this.status,
    required this.data,
    required this.error,
  });

  factory WalletAddressesModel.fromJson(String str) =>
      WalletAddressesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WalletAddressesModel.fromMap(Map<String, dynamic> json) =>
      WalletAddressesModel(
        status: json["status"],
        data: json["data"],
        error: Error.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data,
        "error": error.toMap(),
      };
}

class Error {
  Error();

  factory Error.fromJson(String str) => Error.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Error.fromMap(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toMap() => {};
}
