import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class SubmitComplaint extends StatefulWidget {
  const SubmitComplaint({Key? key}) : super(key: key);

  @override
  _SubmitComplaintState createState() => _SubmitComplaintState();
}

class _SubmitComplaintState extends State<SubmitComplaint> {
  final List<String> provinces = [
    "Central Province",
    "Eastern Province",
    "Northern Province",
    "North Central Province",
    "North Western Province",
    "Sabaragamuwa Province",
    "Southern Province",
    "Uva Province",
    "Western Province",
  ];
  final List<String> districts = [
    "Colombo",
    "Gampaha",
    "Kalutara",
    "Kandy",
    "Matale",
    "Nuwara Eliya",
    "Galle",
    "Matara",
    "Hambantota",
    "Jaffna",
    "Kilinochchi",
    "Mannar",
    "Mullaitivu",
    "Vavuniya",
    "Trincomalee",
    "Batticaloa",
    "Ampara",
    "Kurunegala",
    "Puttalam",
    "Anuradhapura",
    "Polonnaruwa",
    "Badulla",
    "Monaragala",
    "Ratnapura",
    "Kegalle",
  ];

  String? _selectedProvince;
  String? _selectedDistrict;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  String? _fileName;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Submit Complaint",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFF55EE89),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Handle back button press
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600.0, // Adjust the maximum width as needed
            ),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: "Title",
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF55EE89)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF55EE89)),
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 5, // Adjust as needed
                    decoration: InputDecoration(
                      labelText: "Description",
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF55EE89)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF55EE89)),
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    value: _selectedProvince,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedProvince = value;
                      });
                    },
                    items:
                        provinces.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: const Text(
                      "Select Province",
                      style: TextStyle(color: Colors.grey),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    value: _selectedDistrict,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedDistrict = value;
                      });
                    },
                    items:
                        districts.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    hint: const Text(
                      "Select District",
                      style: TextStyle(color: Colors.grey),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Upload Evidence",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Accepted file types: PDF, PNG, JPG",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles();
                              if (result != null) {
                                setState(() {
                                  _fileName = result.files.first.name;
                                });
                              }
                            },
                            icon: const Icon(Icons.upload, color: Colors.black),
                            label: const Text(
                              "Choose File",
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF55EE89),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _fileName ?? "No file uploaded",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your form submission logic here
                        // Access form values using _titleController.text, _descriptionController.text, etc.
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF55EE89),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
