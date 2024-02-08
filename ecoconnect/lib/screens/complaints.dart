import 'package:flutter/material.dart';

import 'assign.dart';
import 'login.dart';

class ComplaintsScreen extends StatefulWidget {
  static const routeName = '/complaintsscreen';

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Complaints'),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'logout') {
                // Handle logout action
                // For example, navigate to the login screen
                Navigator.pushReplacementNamed(context, '/');
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
              // Add more menu items if needed
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Number of Complaints: 10',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: height * 0.8,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    // Replace with actual complaint data
                    String complaintNumber = 'C$index';
                    String description = 'Description of complaint $index';

                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text('Complaint: $complaintNumber'),
                        subtitle: Text(description),
                        trailing: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AssignScreen.routeName);
                          },
                          child: Text('Assign'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
