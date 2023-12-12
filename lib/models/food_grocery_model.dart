class FoodGroceryModel {
  String foodGroceryid;
  String foodGroceryName;
  String foodGroceryExpiryDate;
  String foodGroceryReminder;
  String foodGroceryGroup;
  String foodGroceryNote;

  FoodGroceryModel({
    required this.foodGroceryid,
    required this.foodGroceryName,
    required this.foodGroceryExpiryDate,
    required this.foodGroceryReminder,
    required this.foodGroceryGroup,
    required this.foodGroceryNote,
  });

  factory FoodGroceryModel.fromMap(Map<String, dynamic> map) {
    return FoodGroceryModel(
        foodGroceryid: map['foodGroceryid'],
        foodGroceryName: map['foodGroceryName'],
        foodGroceryExpiryDate: map['foodGroceryExpiryDate'],
        foodGroceryReminder: map['foodGroceryReminder'],
        foodGroceryGroup: map['foodGroceryGroup'],
        foodGroceryNote: map['foodGroceryNote']);
  }

  Map<String, dynamic> toMap() {
    return {
      'foodGroceryid': foodGroceryid,
      'foodGroceryName': foodGroceryName,
      'foodGroceryExpiryDate': foodGroceryExpiryDate,
      'foodGroceryReminder': foodGroceryReminder,
      'foodGroceryGroup': foodGroceryGroup,
      'foodGroceryNote': foodGroceryNote,
    };
  }
}

//______________________________ADD FOOD GROUP__________________________________

class NewFoodGroup {
  String groupName;

  NewFoodGroup({required this.groupName});

  factory NewFoodGroup.fromMap(Map<String, dynamic> map) {
    return NewFoodGroup(
      groupName: map['groupName'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'groupName': groupName,
    };
  }
}
