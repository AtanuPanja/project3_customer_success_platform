import 'package:flutter/material.dart';
import 'package:project3_customer_success_platform/screens/create_project_screen.dart';
import '../widgets/app_logo_header.dart';
import 'projects_screen.dart';
import '../data/list_of_projects.dart' as projects_data;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // saving the data from the file list_of_projects.dart, into state variable listOfProjects
  var listOfProjects = projects_data.listOfProjects;

  // method to update the list of projects in the state
  void updateListOfProjects() {
    setState(() {
      listOfProjects = projects_data.listOfProjects;
    });
  }

  // list of items to show in the drawer
  List<Map<String, dynamic>> listOfDrawerTiles = [
    {'tileName': 'Projects', 'icon': const Icon(Icons.card_travel_rounded)},
    {'tileName': 'Project Managers', 'icon': const Icon(Icons.person_outlined)},
    {'tileName': 'Employees', 'icon': const Icon(Icons.person_add_alt_1_outlined)},
    {'tileName': 'Settings', 'icon': const Icon(Icons.settings_outlined)},
  ];

  // state variable to indicate which tile is selected
  int drawerTileSelected = 0;

  // method to update the selected drawer tile
  void setDrawerTileSelected(int index) {
    setState(() {
      drawerTileSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 24.0, bottom: 24.0),
          child: Builder(
            builder: (context) => InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(Icons.menu),
              ),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        title: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade700,
              ),
            ),
            hintText: 'Search',
            suffixIcon: const Icon(
              Icons.search,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Image.asset('assets/images/default_profile_32px.png'),
              onTap: () {},
            ),
          ),
        ],
      ),
      body: const ProjectsScreen(),
      drawer: Drawer(
        width: screenWidth - 50,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: ListView(
            children: [
              const AppLogoHeader(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => CreateProjectScreen(
                            updateListOfProjects: updateListOfProjects,
                          )),
                    ),
                  );
                },
                child: const Row(
                  children: [
                    Icon(Icons.add),
                    Text('New Project'),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              ...listOfDrawerTiles.asMap().entries.map<ListTile>((e) {
                return ListTile(
                  selected: drawerTileSelected == e.key,
                  selectedTileColor: const Color.fromARGB(68, 0, 113, 234),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  leading:
                      e.value['icon'] ?? const Icon(Icons.card_travel_rounded),
                  title: Text(e.value['tileName'] ?? 'Projects'),
                  onTap: () {
                    setDrawerTileSelected(e.key);
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
