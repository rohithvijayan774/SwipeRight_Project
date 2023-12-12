class UserModel {
  String userid;
  String userName;
  String userEmail;

  UserModel({
    required this.userid,
    required this.userName,
    required this.userEmail,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        userid: map['userid'],
        userName: map['userName'],
        userEmail: map['userEmail']);
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'userName': userName,
      'userEmail': userEmail,
    };
  }
}
