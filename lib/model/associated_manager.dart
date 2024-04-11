import 'dart:convert';

class AssociatedManager {
    final String id;
    final String name;
    final String designation;

    AssociatedManager({
        required this.id,
        required this.name,
        required this.designation,
    });

    factory AssociatedManager.fromRawJson(String str) => AssociatedManager.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AssociatedManager.fromJson(Map<String, dynamic> json) => AssociatedManager(
        id: json['_id'],
        name: json['name'],
        designation: json['designation'],
    );

    Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'designation': designation,
    };
}

