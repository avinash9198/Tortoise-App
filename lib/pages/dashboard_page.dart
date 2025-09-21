import 'package:flutter/material.dart';
import '../data/claims_data.dart';
import 'mobile_card_page.dart';
import 'drawer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String searchQuery = "";
  String? selectedFilter;
  final TextEditingController bulkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Apply search filter
    final filteredClaims = claimsData.where((claim) {
      return claim["name"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
          claim["device"]!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Tortoise"),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.teal.shade50,
            child: const Text(
              "👋 7 employees want to claim their device allowance",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          // Search, Filters & Bulk Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔎 Search TextField (full width)
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, size: 15),
                    hintText: "Search by name",
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // 🔽 Filters + Bulk Actions (row)
                Row(
                  children: [
                    // Filters Dropdown
                    Expanded(
                      flex: 3,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.filter, size: 15),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: selectedFilter,
                        hint: const Text("Filters"),
                        onChanged: (value) {
                          setState(() {
                            selectedFilter = value;
                          });
                        },
                        items: ["Approved", "Pending", "Rejected"]
                            .map(
                              (filter) => DropdownMenuItem(
                                value: filter,
                                child: Text(filter),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Bulk Actions TextField
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: bulkController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.list, size: 15),
                          hintText: "Bulk actions",
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Claims List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredClaims.length,
              itemBuilder: (context, index) {
                final claim = filteredClaims[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal.shade100,
                      child: Text(claim["name"]![0]),
                    ),
                    title: Text(
                      claim["name"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${claim["employee"]}\n${claim["device"]}\n${claim["time"]} • ${claim["emi"]}",
                    ),
                    isThreeLine: true,
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Approve"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MobileCardPage()),
          );
        },
        backgroundColor: Colors.teal,
        label: const Text("View Mobile Card"),
        icon: const Icon(Icons.phone_iphone),
      ),
    );
  }
}
