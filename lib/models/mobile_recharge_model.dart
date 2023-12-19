class MobileRechargeModel {
  String? mobRechargeid;
  String mobOperator;
  String mobRechargeDate;
  String mobRechargeExpiryDate;
  String mobRechargeReminderDate;
  String mobCustomerName;
  int mobCustomerNumber;

  MobileRechargeModel({
    this.mobRechargeid,
    required this.mobOperator,
    required this.mobRechargeDate,
    required this.mobRechargeExpiryDate,
    required this.mobRechargeReminderDate,
    required this.mobCustomerName,
    required this.mobCustomerNumber,
  });

  factory MobileRechargeModel.fromMap(Map<String, dynamic> map) {
    return MobileRechargeModel(
      mobRechargeid: map['mobRechargeid'],
      mobOperator: map['mobOperator'],
      mobRechargeDate: map['mobRechargeDate'],
      mobRechargeExpiryDate: map['mobRechargeExpiryDate'],
      mobRechargeReminderDate: map['mobRechargeReminderDate'],
      mobCustomerName: map['mobCustomerName'],
      mobCustomerNumber: map['mobCustomerNumber'],
    );
  }

  Map<String, dynamic> toMap(id) {
    return {
      'mobRechargeid': id,
      'mobOperator': mobOperator,
      'mobRechargeDate': mobRechargeDate,
      'mobRechargeExpiryDate': mobRechargeExpiryDate,
      'mobRechargeReminderDate': mobRechargeReminderDate,
      'mobCustomerName': mobCustomerName,
      'mobCustomerNumber': mobCustomerNumber,
    };
  }
}

class AddOperator {
  String operatorName;

  AddOperator({required this.operatorName});

  factory AddOperator.fromMap(Map<String, dynamic> map) {
    return AddOperator(
      operatorName: map['operatorName'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'operatorName': operatorName,
    };
  }
}
