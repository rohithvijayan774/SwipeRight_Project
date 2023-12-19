class DTHRechargeModel {
  String? dthRechargeid;
  String dthOperator;
  String dthRechargeDate;
  String dthRechargeExpiryDate;
  String dthRechargeReminderDate;
  String dthCustomerName;
  int dthBillAmount;

  DTHRechargeModel({
    this.dthRechargeid,
    required this.dthOperator,
    required this.dthRechargeDate,
    required this.dthRechargeExpiryDate,
    required this.dthRechargeReminderDate,
    required this.dthCustomerName,
    required this.dthBillAmount,
  });

  factory DTHRechargeModel.fromMap(Map<String, dynamic> map) {
    return DTHRechargeModel(
      dthRechargeid: map['dthRechargeid'],
      dthOperator: map['dthOperator'],
      dthRechargeDate: map['dthRechargeDate'],
      dthRechargeExpiryDate: map['dthRechargeExpiryDate'],
      dthRechargeReminderDate: map['dthRechargeReminderDate'],
      dthCustomerName: map['dthCustomerName'],
      dthBillAmount: map['dthBillAmount'],
    );
  }

  Map<String, dynamic> toMap(id) {
    return {
      'dthRechargeid': id,
      'dthOperator': dthOperator,
      'dthRechargeDate': dthRechargeDate,
      'dthRechargeExpiryDate': dthRechargeExpiryDate,
      'dthRechargeReminderDate': dthRechargeReminderDate,
      'dthCustomerName': dthCustomerName,
      'dthBillAmount': dthBillAmount,
    };
  }
}

class AddDTHOperator {
  String operatorName;

  AddDTHOperator({required this.operatorName});

  factory AddDTHOperator.fromMap(Map<String, dynamic> map) {
    return AddDTHOperator(
      operatorName: map['operatorName'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'operatorName': operatorName,
    };
  }
}
