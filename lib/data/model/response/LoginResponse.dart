class LoginResponse {
  String? message;
  User? user;
  String? token;
  String? statusMsg;

  LoginResponse({this.message, this.user, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    statusMsg = json["statusMsg"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    _data["token"] = token;
    return _data;
  }
}

class User {
  String? name;
  String? email;
  String? role;

  User({this.name, this.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    role = json["role"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["role"] = role;
    return _data;
  }
}
