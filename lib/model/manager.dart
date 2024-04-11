import 'dart:convert';

class Manager {
    final String userId;
    final String email;
    final String picture;
    final String name;

    Manager({
        required this.userId,
        required this.email,
        required this.picture,
        required this.name,
    });

    factory Manager.fromRawJson(String str) => Manager.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    Manager.fromJson(Map<String, dynamic> json) : this(
        userId: json['user_id'],
        email: json['email'],
        picture: json['picture'],
        name: json['name'],
    );

    Map<String, dynamic> toJson() => {
        'user_id': userId,
        'email': email,
        'picture': picture,
        'name': name,
    };
}
