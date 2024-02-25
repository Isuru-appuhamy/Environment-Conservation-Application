import 'package:env_assignment/screens/complaints_public_add.dart';
import 'package:flutter/material.dart';

import 'assign.dart';
import 'login.dart';

class ComplaintsPublic extends StatefulWidget {
  static const routeName = '/complaintspublicscreen';

  @override
  State<ComplaintsPublic> createState() => _ComplaintsPublicState();
}

class _ComplaintsPublicState extends State<ComplaintsPublic> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Widget _buildStatusBox(String title, int number) {
      return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              number.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Complaints'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, ComplaintsPublicAdd.routeName);
            },
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  'Add New',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
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
            Wrap(
              children: [
                _buildStatusBox('Total \nComplaints', 10),
                _buildStatusBox('Complaints \nin Progress', 3),
                _buildStatusBox('Complaints \nSolved', 7),
              ],
            ),
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
                    bool isSolved = index % 2 == 0;

                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text('Complaint: $complaintNumber'),
                        subtitle: Text(description),
                        trailing: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: isSolved ? Colors.green : Colors.orange,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            isSolved ? 'Solved' : 'In Progress',
                            style: TextStyle(color: Colors.white),
                          ),
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