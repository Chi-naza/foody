// class UserModel {
//   String username;
//   String email;
//   String password;

//   UserModel({required this.username, required this.email, required this.password});

//   UserModel.fromJson(Map<String, dynamic> json) :
//     username = json['username'],
//     email = json['email'],
//     password = json['password'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['username'] = this.username;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     return data;
//   }
// }

class UserModel {
  String? access;
  String? refresh;
  User? user;

  UserModel({this.access, this.refresh, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    access = json['access'];
    refresh = json['refresh'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access'] = this.access;
    data['refresh'] = this.refresh;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? pk;
  String? username;
  String? email;
  String? firstName;
  String? lastName;

  User({this.pk, this.username, this.email, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['username'] = this.username;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
