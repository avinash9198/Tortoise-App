import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String selectedMenu = "Dashboard"; // Default selected item

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          // Profile Header
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.teal),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("images/profile.png"),
            ),
            accountName: const Text(
              "Aditya",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            accountEmail: const Text(
              "aditya@gmail.com",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),

          // Dashboard
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            selected: selectedMenu == "Dashboard",
            selectedTileColor: Colors.teal.shade700,
            onTap: () {
              setState(() {
                selectedMenu = "Dashboard";
              });
              Navigator.pop(context);
            },
          ),

          // Claims
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text("Claims"),
            selected: selectedMenu == "Claims",
            selectedTileColor: Colors.teal.shade700,
            onTap: () {
              setState(() {
                selectedMenu = "Claims";
              });
              Navigator.pop(context);
            },
          ),

          // Employee
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Employee"),
            selected: selectedMenu == "Employee",
            selectedTileColor: Colors.teal.shade700,
            onTap: () {
              setState(() {
                selectedMenu = "Employee";
              });
              Navigator.pop(context);
            },
          ),

          // Devices
          ListTile(
            leading: const Icon(Icons.devices),
            title: const Text("Devices"),
            selected: selectedMenu == "Devices",
            selectedTileColor: Colors.teal.shade700,
            onTap: () {
              setState(() {
                selectedMenu = "Devices";
              });
              Navigator.pop(context);
            },
          ),

          const Divider(),

          // Support
          ListTile(
            leading: const Icon(Icons.support),
            title: const Text("Support"),
            selected: selectedMenu == "Support",
            selectedTileColor: Colors.teal.shade700,
            onTap: () {
              setState(() {
                selectedMenu = "Support";
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
