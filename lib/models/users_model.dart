/// Represents a user in the application.
class UsersModel {
  String? fullName;
  String? username;
  String? email;
  String? country;
  String? id;
  bool? isVerified;

  UsersModel({
    this.fullName,
    this.username,
    this.email,
    this.country,
    this.id,
    this.isVerified,
  });

  /// For testing purposes
  UsersModel.defaultValue() {
    fullName = 'fullname';
    username = 'username';
    email = 'testgenius7@gmail.com';
    country = 'country';
    id = 'dhOLNFJTaGZVUWR4hDOJa4uMpd12';
    isVerified = false;
  }

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      fullName: json['full_name'],
      username: json['username'],
      email: json['email'],
      country: json['country'],
      id: json['_id'],
      isVerified: json['isVerified'],
    );
  }

  @override
  String toString() {
    return '''{
      full_name: $fullName,
      username: $username,
      email: $email,
      country: $country,
      _id: $id,
      isVerified: $isVerified,
    }''';
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'full_name': fullName,
      'username': username,
      'email': email,
      'country': country,
      'isVerified': isVerified,
    };
  }
}
