class ElectricityBillModel {
  String? billid;
  int consumerNumber;
  String customerName;
  int billAmount;
  String billDate;
  String dueDate;
  String reminderDate;
  String electricityBoard;
  bool billStatus;

  ElectricityBillModel({
    this.billid,
    required this.consumerNumber,
    required this.customerName,
    required this.billAmount,
    required this.billDate,
    required this.dueDate,
    required this.reminderDate,
    required this.electricityBoard,
    required this.billStatus,
  });

  factory ElectricityBillModel.fromMap(Map<String, dynamic> map) {
    return ElectricityBillModel(
      billid: map['billid'],
      consumerNumber: map['consumerNumber'],
      customerName: map['customerName'],
      billAmount: map['billAmount'],
      billDate: map['billDate'],
      dueDate: map['dueDate'],
      reminderDate: map['reminderDate'],
      electricityBoard: map['electricityBoard'],
      billStatus: map['billStatus'],
    );
  }

  Map<String, dynamic> toMap(id) {
    return {
      'billid': id,
      'consumerNumber': consumerNumber,
      'customerName': customerName,
      'billAmount': billAmount,
      'billDate': billDate,
      'dueDate': dueDate,
      'reminderDate': reminderDate,
      'electricityBoard': electricityBoard,
      'billStatus': billStatus,
    };
  }
}
