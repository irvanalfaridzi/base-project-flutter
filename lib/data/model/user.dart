part of 'models.dart';

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.data,
    required this.support,
  });

  UserData data;
  Support support;

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: UserData.fromJson(json["data"]),
        support: Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "support": support.toJson(),
      };
}

class UserData {
  UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  Support({
    required this.url,
    required this.text,
  });

  String url;
  String text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}

// To parse this JSON data, do
//
//     final listUser = listUserFromJson(jsonString);

ListUser listUserFromJson(String str) => ListUser.fromJson(json.decode(str));

String listUserToJson(ListUser data) => json.encode(data.toJson());

class ListUser {
  ListUser({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<UserData> data;
  Support support;

  factory ListUser.fromJson(Map<String, dynamic> json) => ListUser(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data:
            List<UserData>.from(json["data"].map((x) => UserData.fromJson(x))),
        support: Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "support": support.toJson(),
      };
}

TokenUserResponse tokenUserResponseFromJson(String str) =>
    TokenUserResponse.fromJson(json.decode(str));

String tokenUserResponseToJson(TokenUserResponse data) =>
    json.encode(data.toJson());

class TokenUserResponse {
  TokenUserResponse({
    required this.token,
  });

  String token;

  factory TokenUserResponse.fromJson(Map<String, dynamic> json) =>
      TokenUserResponse(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

RegisterUserResponse registerUserResponseFromJson(String str) =>
    RegisterUserResponse.fromJson(json.decode(str));

String registerUserResponseToJson(RegisterUserResponse data) =>
    json.encode(data.toJson());

class RegisterUserResponse {
  RegisterUserResponse({
    required this.id,
    required this.token,
  });

  int id;
  String token;

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) =>
      RegisterUserResponse(
        id: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
      };
}
