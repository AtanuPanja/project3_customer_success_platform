var listOfProjects = [
    {
      'name': 'Food on time',
      'start_date': '12 Feb 24',
      'status': 'On going',
      'project_manager': 'Dipa Majumdar',
      'members': '0'
    },
    {
      'name': '2023-01-01',
      'start_date': '1 Jan 24',
      'status': 'Closed',
      'project_manager': 'Dipa Majumdar',
      'members': '1'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'In progress',
      'project_manager': 'Dipa Majumdar',
      'members': '2'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'In progress',
      'project_manager': 'Dipa Majumdar',
      'members': '3'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'In progress',
      'project_manager': 'Rohit Shah',
      'members': '30'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'Hold',
      'project_manager': 'Rohit Shah',
      'members': '20'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'In progress',
      'project_manager': 'Rohit Shah',
      'members': '13'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'In progress',
      'project_manager': 'Rohit Shah',
      'members': '9'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'Closed',
      'project_manager': 'Rohit Shah',
      'members': '100'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'Closed',
      'project_manager': 'Rohit Shah',
      'members': '100'
    },
    {
      'name': '2023-01-01',
      'start_date': 'Placeholder for start date',
      'status': 'Closed',
      'project_manager': 'Rohit Shah',
      'members': '100'
    },
];

void addNewProject(
  String name,
  [
    String start_date = '2023-01-01',
    String status = 'In progress',
    String project_manager = 'Dipa Majumdar',
    String members = '2',
  ]
) {
  Map<String, String> newEntry = {
    'name': name,
    'start_date': start_date,
    'status': status,
    'project_manager': project_manager,
    'members': members,
  };

  listOfProjects.insert(0, newEntry);
}