import 'package:flutter/material.dart';
import 'projects_screen.dart';
import '../widgets/new_project_stepper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  List<Widget> widgetOptions = [
    const ProjectsScreen(),
    const NewProjectStepper(),
  ];

  void onOptionSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0,  top: 24.0, bottom: 24.0),
          child: Builder(
            builder: (context) => InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 115, 234),
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        title: TextFormField(
          
          decoration: InputDecoration(
            // fillColor: Colors.grey.shade200,
            // filled: true,
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
      body: widgetOptions[currentIndex],
      drawer: Drawer(
        width: screenWidth - 50,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        // color: Color.fromARGB(255, 0, 115, 234),
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      'Customer Support',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  onOptionSelected(widgetOptions.length - 1);
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Icon(Icons.add),
                    Text('New Project'),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              ListTile(
                selected: currentIndex == 0,
                selectedTileColor: const Color.fromARGB(68, 0, 113, 234),
                selectedColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                leading: const Icon(
                  Icons.card_travel_rounded,
                ),
                title: const Text('Projects'),
                onTap: () {
                  onOptionSelected(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                selectedTileColor: const Color.fromARGB(68, 0, 113, 234),
                selectedColor: Colors.black,
                leading: const Icon(
                  Icons.person_outlined,
                ),
                title: const Text('Project Managers'),
                onTap: () {},
              ),
              ListTile(
                selectedTileColor: const Color.fromARGB(68, 0, 113, 234),
                selectedColor: Colors.black,  
                leading: const Icon(
                  Icons.person_add_alt_1_outlined,
                ),
                title: const Text('Employees'),
                onTap: () {},
              ),
              ListTile(
                selectedTileColor: const Color.fromARGB(68, 0, 113, 234),
                selectedColor: Colors.black,
                leading: const Icon(
                  Icons.settings_outlined,
                ),
                title: const Text('Settings'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

