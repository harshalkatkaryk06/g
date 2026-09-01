// Complete Navigation Program

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(),
              ),
            );

          },
          child: Text("Next"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),

      body: Center(
        child: Text("Second Page"),
      ),
    );
  }
}







// Template
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ============================================================
// TOPIC 7: STATELESS WIDGET
// ============================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ======================================================
      // TOPIC 10: SCAFFOLD + APPBAR
      // ======================================================

      home: const HomeScreen(),
    );
  }
}


// ============================================================
// HOME SCREEN
// ============================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


// ============================================================
// TOPIC 7: STATEFUL WIDGET
// ============================================================

class _HomeScreenState extends State<HomeScreen> {

  // Variable used by StatefulWidget
  int counter = 0;

  // Controller for TextField
  final TextEditingController nameController =
      TextEditingController();

  // Text displayed on screen
  String name = "Student";


  // ==========================================================
  // BUTTON FUNCTION
  // ==========================================================

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }


  void showName() {
    setState(() {
      name = nameController.text;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // ======================================================
      // TOPIC 10: APPBAR
      // ======================================================

      appBar: AppBar(
        title: const Text("Flutter Practical"),
      ),


      // ======================================================
      // TOPIC 9: LAYOUT
      // Column → widgets arranged vertically
      // ======================================================

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // =================================================
            // TOPIC 8: TEXT
            // =================================================

            Text(
              "Hello Flutter",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),


            // =================================================
            // TOPIC 8 + 9: CONTAINER + STYLING
            // =================================================

            Container(
              width: 300,
              height: 100,

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),

              child: const Center(
                child: Text(
                  "Flutter Container",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),


            // =================================================
            // TOPIC 9: ROW
            // =================================================

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: const [

                Icon(
                  Icons.home,
                  color: Colors.blue,
                  size: 30,
                ),

                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),

                Icon(
                  Icons.person,
                  color: Colors.green,
                  size: 30,
                ),
              ],
            ),

            const SizedBox(height: 20),


            // =================================================
            // TOPIC 11: TEXTFIELD
            // =================================================

            TextField(
              controller: nameController,

              decoration: const InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),


            // =================================================
            // TOPIC 11: ELEVATED BUTTON
            // =================================================

            ElevatedButton(
              onPressed: showName,
              child: const Text("Submit"),
            ),

            const SizedBox(height: 10),


            // =================================================
            // DISPLAY USER INPUT
            // =================================================

            Text(
              "Hello, $name",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 20),


            // =================================================
            // TOPIC 7 + 11: STATE + BUTTON
            // =================================================

            Text(
              "Counter: $counter",
              style: const TextStyle(
                fontSize: 25,
              ),
            ),

            ElevatedButton(
              onPressed: increaseCounter,
              child: const Text("Increase"),
            ),


            // =================================================
            // TOPIC 12: NAVIGATION
            // =================================================

            ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                        const SecondScreen(),
                  ),
                );

              },

              child: const Text(
                "Go to Second Screen",
              ),
            ),
          ],
        ),
      ),


      // ======================================================
      // TOPIC 11: FLOATING ACTION BUTTON
      // ======================================================

      floatingActionButton: FloatingActionButton(
        onPressed: increaseCounter,

        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}


// ============================================================
// TOPIC 12: SECOND SCREEN
// ============================================================

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Second Screen"),
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Text(
              "Welcome to Second Screen",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Go back to previous screen
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                "Go Back",
              ),
            ),
          ],
        ),
      ),
    );
  }
}