class Project {
  late String name;
  late String startDate;
  late String status;
  late String projectManager;
  late String members;

  /*
  'name': 'Food on time',
    'start_date': '12 Feb 24',
    'status': 'On going',
    'project_manager': 'Dipa Majumdar',
    'members': '0' */

  Project({required this.name, required this.startDate, required this.status, required this.projectManager, required this.members});

  Project.fromJSON(Map<dynamic, dynamic> json) {
    name = json['name'];
    startDate = json['start_date'];
    status = json['status'];
    projectManager = json['associated_manager']['name'];
    members = json['members'] ?? 'NA';
  }

  Map<String, dynamic> toJSON() {
    return {
      'name': name,
      'start_data': startDate,
      'status': status,
      'associated_manager': {
        '_id': "{id of user}",
        'name': "{name of manager}",
        'designation': "Manager"
    },
    };
  }
}
