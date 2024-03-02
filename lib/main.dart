import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => InkWell(
            child: Container(
              width: 300,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 115, 234),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              child: Image.asset(
                'assets/images/logo.png',
                scale: 0.5,
              ),
                  
            ),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          ),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
        drawer: Drawer(

          width: screenWidth - 50,
          elevation: 2,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(32.0),
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 115, 234),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.asset('assets/images/logo.png'),
              ),
              ElevatedButton(
                onPressed: (){}, 
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text('New Project'),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.card_travel_rounded),
                title: Text('Projects'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
