
class RegisterRequest {
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  RegisterRequest({this.name, this.email, this.password, this.rePassword, this.phone});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    password = json["password"];
    rePassword = json["rePassword"];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["password"] = password;
    _data["rePassword"] = rePassword;
    _data["phone"] = phone;
    return _data;
  }
}