import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ComplaintsPublicAdd extends StatefulWidget {
  static const routeName = '/publicomplaintaddscreen';

  @override
  State<ComplaintsPublicAdd> createState() => _ComplaintsPublicAddState();
}

class _ComplaintsPublicAddState extends State<ComplaintsPublicAdd> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String? _provinceValue;
  String? _districtValue;
  String _filePath = '';

  List<String> _provinceOptions = [
    'Western',
    'Central',
    'Southern',
  ];

  List<String> _districtOptions = [
    'Colombo',
    'Gampaha',
    'Kandy',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text('Add new complaint')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Description Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: _descriptionController,
                    maxLines: null, // Allows multiple lines for the description
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Province Dropdown
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
                  DropdownButtonFormField<String>(
                    value: _provinceValue,
                    onChanged: (value) {
                      setState(() {
                        _provinceValue = value;
                      });
                    },
                    items: _provinceOptions.map((String department) {
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
              SizedBox(height: 16),
              // // District Dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'District',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  DropdownButtonFormField<String>(
                    value: _districtValue,
                    onChanged: (value) {
                      setState(() {
                        _districtValue = value;
                      });
                    },
                    items: _districtOptions.map((String department) {
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
              SizedBox(height: 16),

              // File Upload Field
              ElevatedButton(
                onPressed: () async {
                  // Open file picker when the button is pressed
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    String filePath = result.files.single.path!;
                    setState(() {
                      _filePath = filePath;
                    });
                  }
                },
                child: Text('Upload Evidence'),
              ),
              if (_filePath.isNotEmpty) SizedBox(height: 16),

              // Selected File Text
              if (_filePath.isNotEmpty) Text('Selected File: $_filePath'),
              SizedBox(height: 32),

              // Submit Button
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
        ));
  }
}
