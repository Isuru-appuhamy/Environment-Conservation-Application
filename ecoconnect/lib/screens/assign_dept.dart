import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AssignDept extends StatefulWidget {
  static const routeName = '/assigndeptscreen';

  @override
  State<AssignDept> createState() => _AssignDeptState();
}

class _AssignDeptState extends State<AssignDept> {
  TextEditingController _complaintNoController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _provinceController = TextEditingController();
  TextEditingController _deptController = TextEditingController();
  TextEditingController _fileSubmitController = TextEditingController();

  String? _selectedBeatOfficer;

  String _filePath = '';

  List<String> _beatOfficerOptions = [
    'Janith',
    'Kamal',
    'Rohana',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Assign complaint'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Complaint Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _complaintNoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Title field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Description field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Province field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Province',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _provinceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Department',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _deptController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Assign Department Dropdown
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assign Beat Officer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                DropdownButtonFormField<String>(
                  value: _selectedBeatOfficer,
                  onChanged: (value) {
                    setState(() {
                      _selectedBeatOfficer = value;
                    });
                  },
                  items: _beatOfficerOptions.map((String department) {
                    return DropdownMenuItem<String>(
                      value: department,
                      child: Text(department),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // File Submission option
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Evidence (Proof)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () async {
                    // Open file picker when the button is pressed
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      String filePath = result.files.single.path!;
                      setState(() {
                        _filePath = filePath;
                        _fileSubmitController.text = _filePath;
                      });
                    }
                  },
                  child: Text('Upload Evidence'),
                ),
                SizedBox(height: 8.0),
                if (_filePath.isNotEmpty) Text('Selected File: $_filePath'),
              ],
            ),
            SizedBox(height: 24.0),

            // Submit button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
