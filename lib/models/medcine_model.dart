class MedicineModel {
  String medicineid;
  String medicineName;
  String medicineExpiryDate;
  String medicineReminder;
  String medicineGroup;
  String medicineNote;
  String expiryDate;

  MedicineModel({
    required this.medicineid,
    required this.medicineName,
    required this.medicineExpiryDate,
    required this.medicineReminder,
    required this.medicineGroup,
    required this.medicineNote,
    required this.expiryDate,
  });

  factory MedicineModel.fromMap(Map<String, dynamic> map) {
    return MedicineModel(
      medicineid: map['medicineid'],
      medicineName: map['medicineName'],
      medicineExpiryDate: map['medicineExpiryDate'],
      medicineReminder: map['medicineReminder'],
      medicineGroup: map['medicineGroup'],
      medicineNote: map['medicineNote'],
      expiryDate: map['expiryDate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'medicineid': medicineid,
      'medicineName': medicineName,
      'medicineExpiryDate': medicineExpiryDate,
      'medicineReminder': medicineReminder,
      'medicineGroup': medicineGroup,
      'medicineNote': medicineNote,
      'expiryDate': expiryDate,
    };
  }
}

//______________________________ADD Medicine GROUP__________________________________

class NewMedicineGroup {
  String groupName;

  NewMedicineGroup({required this.groupName});

  factory NewMedicineGroup.fromMap(Map<String, dynamic> map) {
    return NewMedicineGroup(
      groupName: map['groupName'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'groupName': groupName,
    };
  }
}
