import 'dart:convert';

class LoginModel {
    final String status;
    final Data data;
    final Error error;

    LoginModel({
        required this.status,
        required this.data,
        required this.error,
    });

    factory LoginModel.fromJson(String str) => LoginModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
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
    final String token;

    Data({
        required this.token,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "token": token,
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
