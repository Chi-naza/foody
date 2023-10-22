class BikeResponseModel {
  String? id;
  User? user;
  String? firstName;
  String? lastName;
  String? itemDescription;
  String? destinationAddress;
  String? destinationCity;
  String? destinationState;
  String? phoneNumber;
  String? alternativePhoneNumber;
  String? created;
  String? updated;

  BikeResponseModel({
    this.id,
    this.user,
    this.firstName,
    this.lastName,
    this.itemDescription,
    this.destinationAddress,
    this.destinationCity,
    this.destinationState,
    this.phoneNumber,
    this.alternativePhoneNumber,
    this.created,
    this.updated,
  });

  BikeResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    firstName = json['first_name'];
    lastName = json['last_name'];
    itemDescription = json['item_description'];
    destinationAddress = json['destination_address'];
    destinationCity = json['destination_city'];
    destinationState = json['destination_state'];
    phoneNumber = json['phone_number'];
    alternativePhoneNumber = json['alternative_phone_number'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['item_description'] = this.itemDescription;
    data['destination_address'] = this.destinationAddress;
    data['destination_city'] = this.destinationCity;
    data['destination_state'] = this.destinationState;
    data['phone_number'] = this.phoneNumber;
    data['alternative_phone_number'] = this.alternativePhoneNumber;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;

  User({this.id, this.username, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}
