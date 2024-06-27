class User {
  final String? name;
  final String? email;
  List<String>? followingList;

  User({required this.name, required this.email, this.followingList});

  Map<String, dynamic> toJson() {
    return {
      'userName': name,
      'email': email,
    };
  }
  
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['userName'] as String?,
      email: json['email'] as String?,
      followingList: json['followingList'] != null ? List<String>.from(json['followingList']) : null
    );
  }

  User copyWith({String? name, String? email, List<String>? followingList}) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      followingList: followingList ?? this.followingList
    );
  }
}
