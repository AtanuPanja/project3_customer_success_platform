import 'dart:convert';

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