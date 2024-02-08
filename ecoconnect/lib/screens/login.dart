import 'package:env_assignment/screens/complaints_dept.dart';
import 'package:env_assignment/screens/complaints_public.dart';
import 'package:env_assignment/screens/register.dart';
import 'package:flutter/material.dart';

import 'complaints.dart';
import 'complaints_beat.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginscreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center horizontally
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),

              // Password field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.0),

              // Login button
              ElevatedButton(
                onPressed: () {
                  String username =
                      _usernameController.text.trim().toLowerCase();

                  if (username == 'admin') {
                    Navigator.pushReplacementNamed(
                        context, ComplaintsScreen.routeName);
                  } else if (username == 'deptadmin') {
                    Navigator.pushReplacementNamed(
                        context, ComplaintsDept.routeName);
                  } else if (username == 'user') {
                    Navigator.pushReplacementNamed(
                        context, ComplaintsPublic.routeName);
                  } else if (username == 'beatofficer') {
                    Navigator.pushReplacementNamed(
                        context, ComplaintsBeat.routeName);
                  } else {}
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text('Login'),
                ),
              ),

              SizedBox(height: 16.0),

              // Redirect to Register button
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: Text("Don't have an account? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
