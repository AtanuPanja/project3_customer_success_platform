import 'dart:convert';

// this model is different from Manager model, because this is the part of the Project model
// this is helpful during fetching of the projects, because manager data the time of project list fetching, is different from the data fetched at the time of manager list fetching.
// This model has the fields, and the methods for converting to and from Map instances
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

