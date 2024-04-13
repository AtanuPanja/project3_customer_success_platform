import 'dart:convert';

// This model class is used model the budget data, associated with the project list fetched
// This model has the fields, and the methods for converting to and from Map instances
class Budget {
    final String type;
    final String typeValue;

    Budget({
        required this.type,
        required this.typeValue,
    });

    factory Budget.fromRawJson(String str) => Budget.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Budget.fromJson(Map<String, dynamic> json) => Budget(
        type: json['type'],
        typeValue: json['type_value'],
    );

    Map<String, dynamic> toJson() => {
        'type': type,
        'type_value': typeValue,
    };
}