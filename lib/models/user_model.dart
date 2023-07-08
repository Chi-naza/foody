class UserModel {
  String username;
  String email;
  String password;

  UserModel({required this.username, required this.email, required this.password});

  UserModel.fromJson(Map<String, dynamic> json) :
    username = json['username'],
    email = json['email'],
    password = json['password'];
    

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
