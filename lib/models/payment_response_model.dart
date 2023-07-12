class PaymentResponseModel {
  bool error;
  bool validationRequired;
  String txRef;
  String flwRef;
  dynamic suggestedAuth;
  dynamic authUrl;
  String validation;

  PaymentResponseModel({
    required this.error,
    required this.validationRequired,
    required this.txRef,
    required this.flwRef,
    this.suggestedAuth,
    this.authUrl,
    required this.validation
  });

  PaymentResponseModel.fromJson(Map<String, dynamic> json) :
    error = json['error'],
    validationRequired = json['validationRequired'],
    txRef = json['txRef'],
    flwRef = json['flwRef'],
    suggestedAuth = json['suggestedAuth'],
    authUrl = json['authUrl'],
    validation = json['validation'];
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['validationRequired'] = this.validationRequired;
    data['txRef'] = this.txRef;
    data['flwRef'] = this.flwRef;
    data['suggestedAuth'] = this.suggestedAuth;
    data['authUrl'] = this.authUrl;
    data['validation'] = this.validation;
    return data;
  }

  
}
