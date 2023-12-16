class WaterBillModel {
  String? billid;
  int connectionid;
  String customerName;
  int billAmount;
  String billDate;
  String dueDate;
  String reminderDate;
  String authority;
  bool billStatus;

  WaterBillModel({
    this.billid,
    required this.connectionid,
    required this.customerName,
    required this.billAmount,
    required this.billDate,
    required this.dueDate,
    required this.reminderDate,
    required this.authority,
    required this.billStatus,
  });

  factory WaterBillModel.fromMap(Map<String, dynamic> map) {
    return WaterBillModel(
      billid: map['billid'],
      connectionid: map['connectionid'],
      customerName: map['customerName'],
      billAmount: map['billAmount'],
      billDate: map['billDate'],
      dueDate: map['dueDate'],
      reminderDate: map['reminderDate'],
      authority: map['authority'],
      billStatus: map['billStatus'],
    );
  }

  Map<String, dynamic> toMap(id) {
    return {
      'billid': id,
      'connectionid': connectionid,
      'customerName': customerName,
      'billAmount': billAmount,
      'billDate': billDate,
      'dueDate': dueDate,
      'reminderDate': reminderDate,
      'authority': authority,
      'billStatus': billStatus,
    };
  }
}
