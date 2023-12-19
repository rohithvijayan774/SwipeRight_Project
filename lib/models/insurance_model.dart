class InsuranceModel {
  String? insuranceID;
  String insuranceType;
  String insuranceDate;
  String insuranceExpiryDate;
  String insuranceReminderDate;
  String insuranceCustomerName;
  int insuranceCustomerNumber;

  InsuranceModel({
    this.insuranceID,
    required this.insuranceType,
    required this.insuranceDate,
    required this.insuranceExpiryDate,
    required this.insuranceReminderDate,
    required this.insuranceCustomerName,
    required this.insuranceCustomerNumber,
  });

  factory InsuranceModel.fromMap(Map<String, dynamic> map) {
    return InsuranceModel(
      insuranceID: map['insuranceID'],
      insuranceType: map['insuranceType'],
      insuranceDate: map['insuranceDate'],
      insuranceExpiryDate: map['insuranceExpiryDate'],
      insuranceReminderDate: map['insuranceReminderDate'],
      insuranceCustomerName: map['insuranceCustomerName'],
      insuranceCustomerNumber: map['insuranceCustomerNumber'],
    );
  }

  Map<String, dynamic> toMap(id) {
    return {
      'insuranceID': id,
      'insuranceType': insuranceType,
      'insuranceDate': insuranceDate,
      'insuranceExpiryDate': insuranceExpiryDate,
      'insuranceReminderDate': insuranceReminderDate,
      'insuranceCustomerName': insuranceCustomerName,
      'insuranceCustomerNumber': insuranceCustomerNumber,
    };
  }
}


