import 'dart:convert';

// This model class is used to model the nested stack map instance, inside the project map instance
// It contains methods for converting to and from the stack map instance
class Stack {
    final String label;
    final String value;

    Stack({
        required this.label,
        required this.value,
    });

    factory Stack.fromRawJson(String str) => Stack.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Stack.fromJson(Map<String, dynamic> json) => Stack(
        label: json['label'],
        value: json['value'],
    );

    Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
    };
}