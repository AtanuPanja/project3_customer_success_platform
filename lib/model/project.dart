import 'associated_manager.dart';
import 'budget.dart';
import 'stack.dart';

class Project {
    final String id;
    final String name;
    final int members;
    final AssociatedManager associatedManager;
    final String? overview;
    final Budget? budget;
    final String? timeline;
    final Stack? stack;
    final String? scope;
    final String startDate;
    final String status;
    final int v;

    Project({
        required this.id,
        required this.name,
        required this.members,
        required this.associatedManager,
        required this.overview,
        required this.budget,
        required this.timeline,
        required this.stack,
        required this.scope,
        required this.startDate,
        required this.status,
        required this.v,
    });

    Project.fromJson(Map<String, dynamic> json) : this(
        id: json['_id'],
        name: json['name'],
        members: json['members'],
        associatedManager: AssociatedManager.fromJson(json['associated_manager']),
        overview: json['overview'],
        budget: Budget.fromJson(json['budget']),
        timeline: json['timeline'],
        stack: Stack.fromJson(json['stack']),
        scope: json['scope'],
        startDate: json['start_date'],
        status: json['status'],
        v: json['__v'],
    );

    Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'associated_manager': associatedManager.toJson(),
        'overview': overview,
        'budget': budget?.toJson(),
        'timeline': timeline,
        'stack': stack?.toJson(),
        'scope': scope,
        'start_date': startDate,
        'status': status,
        '__v': v,
    };
}




