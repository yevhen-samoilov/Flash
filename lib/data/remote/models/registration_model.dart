import 'dart:convert';

class RegistrationModel {
  final String status;
  final Data data;
  final Error error;

  RegistrationModel({
    required this.status,
    required this.data,
    required this.error,
  });

  factory RegistrationModel.fromJson(String str) =>
      RegistrationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistrationModel.fromMap(Map<String, dynamic> json) =>
      RegistrationModel(
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
  final String mnemonic;

  Data({
    required this.mnemonic,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        mnemonic: json["mnemonic"],
      );

  Map<String, dynamic> toMap() => {
        "mnemonic": mnemonic,
      };
}

class Error {
  Error();

  factory Error.fromJson(String str) => Error.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Error.fromMap(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toMap() => {};
}
