import 'package:flutter/material.dart';
class Drawerpage extends StatelessWidget {
  const Drawerpage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOME"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomePage',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 14, 214, 127),
              ),
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "User Name",
                  style: TextStyle(fontSize: 15),

              ),
               accountEmail: Text(
                "anjus@gmail.com"
               ),
               ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('My Course'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
             ListTile(
              leading: const Icon(Icons.workspace_premium_rounded),
              title: const Text('Go Premium'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
             ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}