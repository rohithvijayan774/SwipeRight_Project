class LoanModel {
  String? loanid;
  int loanAccountNumber;
  String customerName;
  int loanAmount;
  int mobileNumber;
  String dueDate;
  String reminderDate;
  String bank;
  bool loanStatus;

  LoanModel({
    this.loanid,
    required this.loanAccountNumber,
    required this.customerName,
    required this.loanAmount,
    required this.mobileNumber,
    required this.dueDate,
    required this.reminderDate,
    required this.bank,
    required this.loanStatus,
  });

  factory LoanModel.fromMap(Map<String, dynamic> map) {
    return LoanModel(
      loanid: map['loanid'],
      loanAccountNumber: map['loanAccountNumber'],
      customerName: map['customerName'],
      loanAmount: map['loanAmount'],
      mobileNumber: map['mobileNumber'],
      dueDate: map['dueDate'],
      reminderDate: map['reminderDate'],
      bank: map['bank'],
      loanStatus: map['loanStatus'],
    );
  }

  Map<String, dynamic> toMap(id) {
    return {
      'loanid': id,
      'loanAccountNumber': loanAccountNumber,
      'customerName': customerName,
      'loanAmount': loanAmount,
      'mobileNumber': mobileNumber,
      'dueDate': dueDate,
      'reminderDate': reminderDate,
      'bank': bank,
      'loanStatus': loanStatus,
    };
  }
}
