import 'package:flutter/material.dart';
import 'screens/projects_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 0, 115, 234)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
            ),
            shape: MaterialStateProperty.all(
              BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(2.8),
              ),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(
              builder: (context) => InkWell(
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 115, 234),
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ),
          title: TextField(
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              border: InputBorder.none,
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
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.add),
                          Text('New Project'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 7),
                    ListTile(
                      leading: const Icon(
                        Icons.card_travel_rounded,
                      ),
                      title: const Text('Projects'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.person_outlined,
                      ),
                      title: const Text('Project Managers'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.person_add_alt_1_outlined,
                      ),
                      title: const Text('Employees'),
                      onTap: () {},
                    ),
                    ListTile(
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
          ),
        ),
      ),
    );
  }
}
